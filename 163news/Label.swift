//
//  Label.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit

class Label: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textAlignment = NSTextAlignment.Center
        font = UIFont.boldSystemFontOfSize(20)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var scale: CGFloat = 0 {
        didSet {
            textColor = UIColor(red: scale, green: 0, blue: 0, alpha: 1)
            
            let minScale: CGFloat = 0.8
            let itemScale: CGFloat = minScale + (1 - minScale) * scale
            transform = CGAffineTransformMakeScale(itemScale, itemScale)
        }
    }

}
