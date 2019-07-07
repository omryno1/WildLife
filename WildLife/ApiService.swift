//
//  ApiService.swift
//  WildLife
//
//  Created by Omry Dabush on 25/02/2017.
//  Copyright © 2017 Omry Dabush. All rights reserved.
//

import Foundation

class ApiService: NSObject {
    
    static let sharedInstance = ApiService()
    
    func fetchAnimalData(Complition: @escaping ([Animal])->()){
        do {
            //Getting the JSON file and Parsing it
            if let file = Bundle.main.url(forResource: "data", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                
                //trying to read the json file
                if let object = json as? [String: Any] {
                    var animals = [Animal]()
                    
                    //reading JSON object file

                        for dictionary in object["paragraphs"] as! [[String: AnyObject]] {
                            if dictionary["caption"] as? String != "Introduction" {
                                let animal = Animal()
                                var more = [Expantion]()
                                
                                //assigning the data to an Animal Object
                                animal.caption = dictionary["caption"] as? String
                                animal.info = dictionary["text"] as? String
                                
                                //iteraring on the "images" JSON Array object & assigning data to a expantin
                                if let imageArr = dictionary["images"] as? [[String : Any]]{
                                    if imageArr.count != 0{
                                        for item in imageArr{
                                            let expantion = Expantion()
                                            
//                                            let moreData = imageArr[index] as! [String : AnyObject]
                                            
                                            expantion.name = item["name"] as? String
                                            expantion.imageUrl = item["url"] as? String
                                            expantion.explanation = item["explanation"] as? String
                                            more.append(expantion)
                                            
                                        }
                                    }
                                    
                                }
                                animal.more = more
                                animals.append(animal)
                                Complition(animals)
                        }
                    }
                    
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }

}
