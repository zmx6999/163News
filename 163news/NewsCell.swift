//
//  ChannelCell.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    
    @IBOutlet weak var titleView: UILabel!
    
    @IBOutlet weak var digestView: UILabel!
    
    @IBOutlet weak var replyCountView: UILabel!
    
    @IBOutlet var imagesView: [UIImageView]!

    static func cell(identifier: String, tableView: UITableView) -> NewsCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? NewsCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed(identifier, owner: nil, options: nil).first as? NewsCell
        }
        return cell!
    }
    
    var news: News? {
        didSet {
            iconView.sd_setImageWithURL(NSURL(string: (news?.imgsrc)!))
            titleView.text = news?.title
            if digestView != nil {
                digestView.text = news?.digest
            }
            replyCountView.text = "\((news?.replyCount)!)评论"
            if imagesView != nil {
                for var i:Int = 0; i < imagesView.count; i++ {
                    let iv = imagesView[i]
                    iv.sd_setImageWithURL(NSURL(string: (news?.imgextra![i]["imgsrc"])! as! String))
                }
            }
        }
    }
    
}
