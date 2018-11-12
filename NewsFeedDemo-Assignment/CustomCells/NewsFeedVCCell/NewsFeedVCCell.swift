//
//  NewsFeedVCCell.swift
//  NewsFeedDemo-Assignment
//
//  Created by M Abdullah Waseer on 08/11/2018.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import UIKit

class NewsFeedVCCell: UITableViewCell {

    @IBOutlet weak var newsFeedImageView        : UIImageView?
    @IBOutlet weak var lblNewsTitle             : UILabel?
    @IBOutlet weak var lblNewsShortDescription  : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
