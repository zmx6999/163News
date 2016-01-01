//
//  CycleView.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit

class CycleView: UIView {

    weak var contentView: CycleContentView?
    
    override func awakeFromNib() {
        let cv = NSBundle.mainBundle().loadNibNamed("CycleContentView", owner: nil, options: nil).first as? CycleContentView
        contentView = cv
        addSubview(contentView!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView?.frame = bounds
    }

}
