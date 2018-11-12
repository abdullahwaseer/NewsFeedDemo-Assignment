//
//  NewsFeedCategory.swift
//  NewsFeedDemo-Assignment
//
//  Created by M Abdullah Waseer on 08/11/2018.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import UIKit
import ObjectMapper


struct NewsFeedItem : Mappable {
    
    var title        : String?
    var author       : String?
    var description  : String?
    var url          : String?
    var urlToImage   : String?
    var publishedAt  : String?
    var content      : String?

    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        //this is an iterative method that maps response objects to declared variables  
        
        title           <- map["title"]
        author          <- map["author"]
        description     <- map["description"]
        url             <- map["url"]
        urlToImage      <- map["urlToImage"]
        publishedAt     <- map["publishedAt"]
        content         <- map["content"]
    }
    
}
