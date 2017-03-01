//
//  FeedCell.swift
//  WildLife
//
//  Created by Omry Dabush on 27/02/2017.
//  Copyright © 2017 Omry Dabush. All rights reserved.
//

import UIKit

class FeedCell :UICollectionViewCell ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var feedCollectionView: UICollectionView!
    
    var animal : Animal?
    var index : Int?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    func setupViews() {
        setupCollectionView()
    }
    
    func setupCollectionView(){
        //Loading the collectionView XIB
        Bundle.main.loadNibNamed("FeedCollectionView", owner: self, options: nil)
        self.addSubview(feedCollectionView)
        
        //Loading cell XIB
        let nib = UINib(nibName: "detailsCell", bundle: nil)
        self.feedCollectionView.register(nib, forCellWithReuseIdentifier: "detailsCell")
        
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        
        //setting the CollectionView Size to the SuperClass Cell Size
        self.feedCollectionView.frame = self.bounds
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsCell", for: indexPath) as! detailsCell
        cell.i = index
        cell.animal = self.animal
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = (frame.width - 8 - 8) * (9/16)
        
        return CGSize(width: self.frame.width, height: self.frame.height + height)
    }
    
    
    
}
