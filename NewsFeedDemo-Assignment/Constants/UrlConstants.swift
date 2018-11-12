//
//  UrlConstants.swift
//  dineage
//
//  Created by M Abdullah Waseer on 10/10/2018.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import Foundation


let BaseURL_ALT1            = "https://newsapi.org/v2/everything"
let BaseURL_ALT2            = "https://newsapi.org/v2/top-headlines"

let NewsFeed_API_KEY        = "c213dc8cfdf7486594719fac92fbaab2"

let BitcoinNewFeedPath        = "\(BaseURL_ALT1)?q=bitcoin&from=\(Date().formattedDateString())&sortBy=publishedAt&apiKey=\(NewsFeed_API_KEY)"
let USbusinessNewsPath           = "\(BaseURL_ALT2)?country=us&category=business&apiKey=\(NewsFeed_API_KEY)"
let AppleNewFeedPath             = "\(BaseURL_ALT1)?q=apple&from=\(Date().formattedDateString())&to=\(Date().formattedDateString())&sortBy=popularity&apiKey=\(NewsFeed_API_KEY)"
let WallStreetJournalPath        = "\(BaseURL_ALT1)?domains=wsj.com&apiKey=\(NewsFeed_API_KEY)"
let TechrunchNewFeedPath         = "\(BaseURL_ALT2)?sources=techcrunch&apiKey=\(NewsFeed_API_KEY)"
