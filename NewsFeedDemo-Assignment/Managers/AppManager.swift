//
//  AppManager.swift
//  NewsFeedDemo-Assignment
//
//  Created by M Abdullah Waseer on 11/11/2018.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import UIKit

class AppManager: NSObject {

    // Declare class instance property
    static let sharedInstance = AppManager()
    
    override init() {
        super.init()
        print("AppManager has been initialized")
        self.commonInit()
    }
    
    func commonInit() {
        
    }
    
    func fetchNewsFeedCategories() -> [NewsFeedCategory] {
        
        var newsCategories = [NewsFeedCategory]()
        newsCategories.append(populateCategoryWith(categoryName: "Bitcoin", url: BitcoinNewFeedPath, themeColor: UIColor.bitcoinThemeColor()))
        newsCategories.append(populateCategoryWith(categoryName: "US business stories", url: USbusinessNewsPath, themeColor: UIColor.usBuninessThemeColor()))
        newsCategories.append(populateCategoryWith(categoryName: "Apple", url: AppleNewFeedPath, themeColor: UIColor.appleNewsThemeColor()))
        newsCategories.append(populateCategoryWith(categoryName: "Techrunch", url: TechrunchNewFeedPath, themeColor: UIColor.techrunchThemeGreenColor()))
        newsCategories.append(populateCategoryWith(categoryName: "Walstreet Journal", url: WallStreetJournalPath, themeColor: UIColor.wallStreetThemeGreenColor()))

        return newsCategories
    }
    
    func populateCategoryWith(categoryName : String, url : String, themeColor : UIColor) -> NewsFeedCategory {
        
        let category = NewsFeedCategory()
        category.name = categoryName
        category.url = url
        category.themeColor = themeColor
        
        return category
    }
}
