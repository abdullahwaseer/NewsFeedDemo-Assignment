//
//  BaseService.swift
//  Test
//
//  Created by M Abdullah Waseer on 2/9/17.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import Foundation
import Alamofire
//import SwiftyJSON

class BaseService {
    
    /*
    func initiateRequest(url: String, method: HTTPMethod, parameters: [String : AnyObject]?, success: @escaping(DataResponse<Any>) -> Void, failure: @escaping(Error) -> Void ) -> DataRequest {
        
        let headers = setHeaders()
        return APIManager.request(url, method: method, params: parameters, headers: headers, success: { (response) in
            success(response)
        }) { (error) in
            failure(error)
        }
    }
    
    func initiateRequest(url: String, method: HTTPMethod, parameters: [String : AnyObject]?, encoding : ParameterEncoding, success: @escaping(JSON) -> Void, failure: @escaping(Error) -> Void ) -> DataRequest {
        
        let headers = setHeaders()
        return APIManager.request(url, method: method, params: parameters, headers: headers, encoding : encoding, success: { (response) in
            success(response)
        }) { (error) in
            failure(error)
        }
    }
    */
    
    func setHeaders() -> [String : String] {
        var headers = [String : String]()
        
//        let deviceId = UIDevice.current.identifierForVendor!.uuidString
        headers = ["type"         : "mobile",
                   "Content-Type"   : "application/json"]
        
        return headers
    }
    
}
