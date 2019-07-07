//
//  DetailsViewController.swift
//  WildLife
//
//  Created by Omry Dabush on 25/02/2017.
//  Copyright © 2017 Omry Dabush. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var pickedAnimal : Animal? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMainCollectionView()
        setupPageControl()
    }
    
    func setupMainCollectionView(){
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self

    }
    
    func setupPageControl(){
        if let numberOfPages = pickedAnimal?.more?.count {
            self.pageControl.numberOfPages = numberOfPages
            self.pageControl.currentPage = 0
            self.pageControl.pageIndicatorTintColor = UIColor.gray
            self.pageControl.currentPageIndicatorTintColor =  UIColor.white

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (pickedAnimal?.more?.count)!
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as! FeedCell
        
        if pickedAnimal != nil{
            cell.animal = pickedAnimal
            cell.index = indexPath.item
        }
        
        cell.feedCollectionView.frame = cell.bounds
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = mainCollectionView.frame.size.width
        pageControl.currentPage = Int(self.mainCollectionView.contentOffset.x / pageWidth)
    }

    

}
