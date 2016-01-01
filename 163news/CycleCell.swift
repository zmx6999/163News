//
//  CycleCell.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit
import SDWebImage

class CycleCell: UICollectionViewCell {

    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleView: UILabel!

    var cycle: Cycle? {
        didSet {
            iconView.sd_setImageWithURL(NSURL(string: (cycle?.imgsrc)!))
            titleView.text = cycle?.title
        }
    }

}
