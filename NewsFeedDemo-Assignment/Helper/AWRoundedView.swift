//
//  AWRoundedView.swift
//  NewsFeedDemo-Assignment
//
//  Created by M Abdullah Waseer on 11/11/2018.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import UIKit

class AWRoundedView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.cornerRadius = 5.0
            //self.bounds.size.height / 2.0
    }

}
