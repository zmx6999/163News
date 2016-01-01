//
//  CycleContentView.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit

class CycleContentView: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    var cycles = [Cycle]()
    
    var identifier = "cycle"
    
    var minSection = 3
    
    override func awakeFromNib() {
        collectionView.registerNib(UINib(nibName: "CycleCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        
        Cycle.cycles { (cycles) -> Void in
            self.cycles = cycles
            
            self.pageControl.numberOfPages = cycles.count
            self.collectionView.reloadData()
            self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: 0, inSection: self.minSection / 2), atScrollPosition: UICollectionViewScrollPosition.None, animated: false)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout.itemSize = bounds.size
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return minSection
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cycles.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as? CycleCell
        cell?.cycle = cycles[indexPath.item]
        return cell!
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = (Int)(scrollView.contentOffset.x / scrollView.bounds.size.width) % pageControl.numberOfPages
        pageControl.currentPage = index
        collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: index, inSection: minSection / 2), atScrollPosition: UICollectionViewScrollPosition.None, animated: false)
    }

}
