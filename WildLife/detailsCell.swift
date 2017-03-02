//
//  detailsCell.swift
//  WildLife
//
//  Created by Omry Dabush on 27/02/2017.
//  Copyright © 2017 Omry Dabush. All rights reserved.
//

import UIKit

class detailsCell: UICollectionViewCell {
    
    @IBOutlet weak var animalImage: CustomeImageView!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var about: UILabel!
    @IBOutlet weak var explanation: UILabel!

    var i : Int?
    var aboutLabelHeight: NSLayoutConstraint?
    var explanationLabelHeight: NSLayoutConstraint?
    
    var animal : Animal? {
        didSet {
            setupImage()
            setupLabels()
            setupViews()
            
            
    //dynamically setting label size
            if let expla = animal?.more?[i!].explanation{
                let size = CGSize(width: frame.width - 16 , height: 1000)
                
                let estimatedExplanation = NSString(string: expla).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize:19)] , context: nil)
                explanationLabelHeight?.constant = estimatedExplanation.size.height

            }
            
            if let about = animal?.info {
                let size = CGSize(width: frame.width - 16 , height: 1000)
                
                let estimatedAbout = NSString(string: about).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize:16)] , context: nil)
                aboutLabelHeight?.constant = estimatedAbout.size.height + 5
            }
            
        }
    }
    
    
    func setupImage(){
        if let image = animal?.more?[i!].imageUrl {
            self.animalImage.loadImageUsingUrlString(image)
        }
        animalImage.layer.cornerRadius = 20
        animalImage.layer.masksToBounds = true
    }
    
    func setupLabels(){
        if let name = animal?.more?[i!].name {
            self.animalName.text = name
            self.animalName.sizeToFit()
        }
        if let about = animal?.info {
            self.about.text = about
            self.about.sizeToFit()
        }
        if let exp = animal?.more?[i!].explanation {
            self.explanation.text = exp
            self.explanation.sizeToFit()
        }
        
    }
    
    func setupViews(){
        
        //Label Height Constraints
        aboutLabelHeight = NSLayoutConstraint(item: about, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        addConstraint(aboutLabelHeight!)
        
        explanationLabelHeight = NSLayoutConstraint(item: explanation, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 44)
        addConstraint(explanationLabelHeight!)
    }
    
    
}
