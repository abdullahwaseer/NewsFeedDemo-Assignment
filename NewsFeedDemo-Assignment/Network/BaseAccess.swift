//
//  BaseAccess.swift
//  dineage
//
//  Created by M Abdullah Waseer on 11/10/2018.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import Foundation
import Alamofire


class BaseAccess {
    
    func requestHeaders() -> [String : String] {
        var headers = [String : String]()
        
        headers = ["type" : "mobile"]
        
        return headers
    }
    
    func parameterEncoding() -> ParameterEncoding {
        
        return JSONEncoding.default
    }
}


