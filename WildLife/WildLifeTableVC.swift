//
//  WildLifeTableVC.swift
//  WildLife
//
//  Created by Omry Dabush on 25/02/2017.
//  Copyright © 2017 Omry Dabush. All rights reserved.
//

import UIKit

class WildLifeTableVC: UITableViewController {
    
    var animals = [Animal]()

    override func viewDidLoad() {
        super.viewDidLoad()

        handleNavImage()
        ApiService.sharedInstance.fetchAnimalData { (animals) in
            self.animals = animals
        }

    }
    
    
    func handleNavImage(){
        let icon = UIImage(named: "bear")
        let iconImage = UIImageView(image: icon)
        iconImage.clipsToBounds = true
        iconImage.contentMode = .scaleAspectFill
        self.navigationItem.titleView = iconImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return animals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! WildLifeTableViewCell
        cell.animal = animals[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsViewController
        detailsVC.pickedAnimal = animals[indexPath.row]
        self.navigationController?.show(detailsVC, sender: self)

    }

}
