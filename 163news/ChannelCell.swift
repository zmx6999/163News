//
//  ChannelCell.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit

class ChannelCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tid: String? {
        didSet {
            News.messages(tid!) { (messages) -> Void in
                print("\(self.tid!)")
                self.messages = messages
                self.tableView.reloadData()
                if self.messages.count > 0 {
                    self.tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: UITableViewScrollPosition.None, animated: false)
                }
            }
        }
    }
    
    var messages = [News]()
    
    override func awakeFromNib() {
        tableView.tableFooterView = UIView()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var identifier = ""
        let news = messages[indexPath.row]
        if news.imgextra != nil {
            identifier = "ImagesCell"
        } else if news.imgType > 0 {
            identifier = "BigCell"
        } else {
            identifier = "BaseCell"
        }
        let cell = NewsCell.cell(identifier, tableView: tableView)
        cell.news = news
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let news = messages[indexPath.row]
        if news.imgextra != nil {
            return 120
        } else if news.imgType > 0 {
            return 180
        } else {
            return 80
        }
    }

}
