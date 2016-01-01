//
//  News.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit

class News: NSObject {
    
    var title: String?
    
    var digest: String?
    
    var replyCount = 0
    
    var imgsrc: String?
    
    var imgextra: [[String: AnyObject]]?
    
    var imgType = 0
    
    var tid: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    static func messages(tid: String, completionHandler: (([News]) -> Void)?) {
        let tool = NetworkTool.sharedTool()
        tool.GET("article/headline/\(tid)/0-40.html", parameters: nil, progress: nil, success: { (task, obj) -> Void in
            var messages = (obj as! [String: AnyObject])[tid] as? [[String: AnyObject]]
            var arrM = [News]()
            for var i:Int = 0; i < messages!.count; i++ {
                let news = News(dict: messages![i])
                arrM.append(news)
            }
            completionHandler!(arrM)
            }) { (task, error) -> Void in
                
        }
    }

}
