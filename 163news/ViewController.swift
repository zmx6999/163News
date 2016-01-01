//
//  ViewController.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var channelView: UIScrollView!
    
    @IBOutlet weak var cycleView: CycleView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    lazy var channels = Channel.channels()
    
    var identifier = "channel"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupChannelView()
        collectionView.registerNib(UINib(nibName: "ChannelCell", bundle: nil), forCellWithReuseIdentifier: identifier)
    }
    
    override func viewDidAppear(animated: Bool) {
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height - CGRectGetMaxY(cycleView.frame))
    }

    func setupChannelView() {
        let w: CGFloat = 80
        let h: CGFloat = 30
        let y: CGFloat = (channelView.bounds.size.height - h) * 0.5
        let n: Int = channels.count
        for var i:Int = 0; i < n; i++ {
            let label = Label(frame: CGRect(x: w * CGFloat(i), y: y, width: w, height: h))
            channelView.addSubview(label)
            label.text = channels[i].tname
            if i == 0 {
                label.scale = 1.0
            } else {
                label.scale = 0
            }
            label.tag = i
            label.userInteractionEnabled = true
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "onTap:"))
        }
        channelView.contentSize = CGSize(width: w * CGFloat(n), height: 0)
    }
    
    func tapLabel(label: Label) {
        collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: label.tag, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.None, animated: false)
        
        for var i:Int = 0; i < channels.count; i++ {
            let currentLabel = channelView.subviews[i] as? Label
            if i == label.tag {
                currentLabel?.scale = 1.0
            } else {
                currentLabel?.scale = 0
            }
        }
        
        var dx = label.center.x - channelView.center.x
        if dx < 0 {
            dx = 0
        } else {
            let delta = channelView.contentSize.width - channelView.bounds.size.width
            if dx > delta {
                dx = delta
            }
        }
        channelView.setContentOffset(CGPoint(x: dx, y: 0), animated: true)
    }
    
    func onTap(tap: UITapGestureRecognizer) {
        let label = tap.view as! Label
        tapLabel(label)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channels.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as? ChannelCell
        cell?.tid = channels[indexPath.row].tid
        return cell!
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = (Int)(scrollView.contentOffset.x / scrollView.bounds.size.width)
        tapLabel(channelView.subviews[index] as! Label)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.bounds.size.width
        let last = Int(index)
        let delta = index - CGFloat(last)
        let lastLabel = channelView.subviews[last] as! Label
        lastLabel.scale = 1 - delta
        let next = last + 1
        if next < channelView.subviews.count {
            let nextLabel = channelView.subviews[next] as! Label
            nextLabel.scale = delta
        }
    }

}

