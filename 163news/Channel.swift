//
//  Channel.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit

class Channel: NSObject {
    
    var tid: String?
    
    var tname: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    static func channels() -> [Channel] {
        var arrM = [Channel]()
        let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("topic_news.json", ofType: nil)!)
        do {
            var json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves) as! [String: AnyObject]
            var channels = json["tList"] as! [[String: AnyObject]]
            for var i:Int = 0; i < channels.count; i++ {
                let channel = Channel(dict: channels[i])
                arrM.append(channel)
            }
            arrM.sortInPlace({ (s1, s2) -> Bool in
                return s1.tid < s2.tid
            })
        }
        catch {
            
        }
        return arrM
    }

}
