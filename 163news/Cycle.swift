//
//  Cycle.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit

class Cycle: NSObject {
    
    var title: String?
    
    var imgsrc: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    static func cycles(completionHandler:(([Cycle]) -> Void)?) {
        let tool = NetworkTool.sharedTool()
        tool.GET("ad/headline/0-4.html", parameters: nil, progress: nil, success: { (task, obj) -> Void in
            var cycles = (obj as! [String: AnyObject])["headline_ad"] as! [[String: AnyObject]]
            var arrM = [Cycle]()
            for var i:Int = 0; i < cycles.count; i++ {
                let cycle = Cycle(dict: cycles[i])
                arrM.append(cycle)
            }
            completionHandler!(arrM)
            }) { (task, error) -> Void in
                
        }
    }

}
