//
//  WildLifeTableViewCell.swift
//  WildLife
//
//  Created by Omry Dabush on 25/02/2017.
//  Copyright © 2017 Omry Dabush. All rights reserved.
//

import UIKit


class WildLifeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var backgroundImage: CustomeImageView!
    


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var seperator: UIView!
    
    
    var animal : Animal? {
        didSet{
            setupBackground()
            setupLabels()
        }
    }
    
    func setupBackground(){
        
        if let image = animal?.more?[0].imageUrl {
            self.backgroundImage.loadImageUsingUrlString(image)
        }
    }
    
    func setupLabels(){
        self.nameLabel.text = animal?.caption
        self.infoLabel.text = animal?.info
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
