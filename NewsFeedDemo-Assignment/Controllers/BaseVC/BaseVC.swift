//
//  BaseVC.swift
//  NewsFeedDemo-Assignment
//
//  Created by M Abdullah Waseer on 08/11/2018.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    func setUpNavigationTitleWithString(title : String) {
        
        let fontName = kFontName_AmericanTypewriter
        
        let label : UILabel  = UILabel ()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        label.font = UIFont.init(name: fontName, size: 18.0)
        label.text = title
        label.textColor = UIColor.white
        navigationItem.titleView = label
    }
    
    func viewForTitle(title: String, subTitle: String = "") -> UIView {
        let width = UIScreen.main.bounds.size.width - 120.0
        let labelHeight: CGFloat = 20.0
        
        var titleViewHeight = 20.0
        var subTitleLabel: UILabel?
        
        let titleLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: width, height: labelHeight))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont(name: kFontName_AmericanTypewriter, size: 16.0)
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.text = title
        
        if subTitle != "" {
            subTitleLabel = UILabel(frame: CGRect(x: 0.0, y: titleLabel.frame.origin.y + labelHeight - 5.0, width: width, height: labelHeight))
            subTitleLabel?.backgroundColor = UIColor.clear
            subTitleLabel?.font = UIFont(name: kFontName_AmericanTypewriter, size: 12.0)
            subTitleLabel?.textAlignment = .center
            subTitleLabel?.textColor = UIColor.white
            subTitleLabel?.text = subTitle
            
            titleViewHeight = 35.0
        }
        
        let titleView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Double(width), height: titleViewHeight))
        titleView.addSubview(titleLabel)
        if let label = subTitleLabel {
            titleView.addSubview(label)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        titleView.addGestureRecognizer(tap)
        
        return titleView
    }
    
    @objc func tapped() {
        backButtonPressed()
    }
    
    @IBAction func backButtonPressed() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
