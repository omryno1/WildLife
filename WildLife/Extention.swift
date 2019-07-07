//
//  CustomImageView.swift
//  WildLife
//
//  Created by Omry Dabush on 25/02/2017.
//  Copyright © 2017 Omry Dabush. All rights reserved.
//

import UIKit

let imageCache = NSCache< NSString , UIImage>()

class CustomeImageView: UIImageView {
    
    var imageUrlString: String?
    var urlString : String?
    
    func loadImageUsingUrlString(_ imageURL: String){
        
        self.image = nil

        
        //Encode spacial charachters
        if imageURL.doesHavaSpecialCharacters() {
            urlString = imageURL.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        }else {
            urlString = imageURL
        }
        
        
        imageUrlString = urlString
        

        let url = URL(string: urlString!)
        
        if let imageFromCache = imageCache.object(forKey: urlString! as NSString){
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil{
                print (error ?? "")
            }
            
            // Bounce back to the main thread to update the UI
            DispatchQueue.main.async(execute: {
                let imageToCache = UIImage(data: data!)
                if self.imageUrlString == self.urlString {
                    self.image = imageToCache
                    imageCache.setObject(imageToCache!, forKey: self.urlString! as NSString)
                }
 
            })
        }).resume()
    }
}

extension String {
    
    func doesHavaSpecialCharacters() -> Bool{
        
        if self.contains("%"){
            return false
        }else {return true}
    }
}
