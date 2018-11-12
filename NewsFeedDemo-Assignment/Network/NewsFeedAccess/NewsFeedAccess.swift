//
//  NewsFeedAccess.swift
//  NewsFeedDemo-Assignment
//
//  Created by M Abdullah Waseer on 11/10/2018.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class NewsFeedAccess : BaseAccess {
    
    func fetchNewsFeed(categoryUrl : String, success: @escaping (_ newsFeeds: [NewsFeedItem]) -> Void, failure: @escaping (String) -> Void) {
        
        //setting up Alamofire to fetch the response for a specific news feed which will be later mapped by object mapper
        
        /// - Parameters:
        /// - categoryUrl: request url and generellay a category url for which the news feed will be fetched
        
        /// - Closures:
        /// - success: when request is successfull, newsFeeds is returned that is array of NewsFeedItem type objects
        /// - failure: when request is not successfull, a String type object is returned containing error description
        
        Alamofire.request(categoryUrl, method: .get, parameters: nil,  encoding: self.parameterEncoding(), headers: self.requestHeaders())
            .validate(contentType: ["application/json"])
            .responseObject { (response: DataResponse<NewsFeedResponse> )in
                
                switch response.result {
                    
                case .success:
                    let newsFeedResponse = response.result.value
                    success((newsFeedResponse?.newsFeeds)!)
                    
                case .failure(let error):
                    
                    let errorMessage = error.localizedDescription 
                    failure(errorMessage)
                }
        }
    }
}


struct NewsFeedResponse : Mappable {
    var newsFeeds : [NewsFeedItem]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        newsFeeds   <- map["articles"]
    }
}
