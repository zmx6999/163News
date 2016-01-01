//
//  NetworkTool.swift
//  163news
//
//  Created by zmx on 15/12/14.
//  Copyright © 2015年 zmx. All rights reserved.
//

import UIKit
import AFNetworking

class NetworkTool: AFHTTPSessionManager {
    
    static var tool = NetworkTool(baseURL: NSURL(string: "http://c.3g.163.com/nc/"), sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration())
    
    static func sharedTool() -> NetworkTool {
        return tool
    }
    
    override init(baseURL url: NSURL?, sessionConfiguration configuration: NSURLSessionConfiguration?) {
        super.init(baseURL: url, sessionConfiguration: configuration)
        responseSerializer.acceptableContentTypes?.insert("text/html")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
