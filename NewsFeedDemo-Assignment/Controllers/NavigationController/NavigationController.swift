//
//  NavigationController.swift
//  Ejazah
//
//  Created by TCIG Murtaza on 1/24/17.
//  Copyright © 2017 TCIG. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarSetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: Customization
    
    func navigationBarSetup() {
        
        self.setNavigationBarHidden(false, animated: false)
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIColor.navigationBarBottomLineColor().navigationBarBottomLine()
        self.navigationBar.tintColor = UIColor.white
        
        let navigationBarColor = UIColor.navigationBarColor()
        self.navigationBar.barTintColor = navigationBarColor
        
        self.navigationBar.isTranslucent = false
    }
}
