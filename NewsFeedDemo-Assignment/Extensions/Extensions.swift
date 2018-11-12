//
//  Extensions.swift
//  Ejazah
//
//  Created by M Abdullah Waseer on 1/31/17.
//  Copyright © 2018 M Abdullah Waseer. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


extension UITextField {
    
    func addSpacer(space: CGFloat = 10) {
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:space, height:space))
        self.leftViewMode = UITextField.ViewMode.always
        self.leftView = spacerView
        self.rightViewMode = UITextField.ViewMode.always
        self.rightView = spacerView
    }
    
    var count:Int {
        get{
            return self.text?.count ?? 0
        }
    }
    
    var validText: String {
        get{
            return (self.text?.trimmingCharacters(in: CharacterSet.whitespaces))!
        }
    }
}


extension UIColor {
    
    class func bitcoinThemeColor() -> UIColor {
        return UIColor(red:90.0/255.0, green:165.0/255.0, blue:251.0/255.0, alpha:1.0)
    }
    
    class func usBuninessThemeColor() -> UIColor {
        return UIColor(red:243.0/255.0, green:164.0/255.0, blue:53.0/255.0, alpha:1.0)
    }
    
    class func appleNewsThemeColor() -> UIColor {
        return UIColor(red:251.0/255.0, green:146.0/255.0, blue:146.0/255.0, alpha:1.0)
    }
    
    class func wallStreetThemeGreenColor() -> UIColor {
        return UIColor(red:20.0/255.0, green:134.0/255.0, blue:178.0/255.0, alpha:1.0)
    }
    
    class func techrunchThemeGreenColor() -> UIColor {
        return UIColor(red:191.0/255.0 , green:171.0/255.0  ,blue:171.0/255.0 , alpha:1.0)
    }
    
    class func bookingStatusCompletedColor() -> UIColor {
        return UIColor(red: 158.0/255.0, green: 188.0/255.0, blue: 46.0/255.0, alpha: 1.0)
    }
    
    class func navigationBarColor() -> UIColor {
        return UIColor(red: 182.0/255.0, green: 40.0/255.0, blue: 54.0/255.0, alpha: 0.2)
    }
    
    class func navigationBarBottomLineColor() -> UIColor {
        return UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.2)
    }
    
    func navigationBarBottomLine() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let contex = UIGraphicsGetCurrentContext()
        self.setFill()
        contex!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    class func flightHotelPackagesColor() -> UIColor {
        return UIColor(red: 94.0/255.0, green: 126.0/255.0, blue: 148.0/255.0, alpha: 1.0)
    }
}


extension String {
    
    var localize: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func emailFirstPart() -> String {
        var firstPart = ""
        let array = self.components(separatedBy: "@")
        firstPart = array[0]
        
        return firstPart
    }
    
    var valid: String {
        get{
            return self.trimmingCharacters(in: CharacterSet.whitespaces)
        }
    }
    
    func contains(find: String) -> Bool {
        return self.range(of: find, options: [NSString.CompareOptions.caseInsensitive, NSString.CompareOptions.numeric] ) != nil
    }
    
    func date() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        var date_Formatted = formatter.date(from: self)
        if date_Formatted == nil {
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            date_Formatted = formatter.date(from: self)
        }
        
        return date_Formatted!
    }
    
    func calculateTimeInHourMin() -> String {
        
        if self.isEmpty == true {
            return ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        //dateFormatter.timeZone = TimeZone.current
        //dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale.current
        let convertedDate = dateFormatter.date(from: self)
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        timeFormatter.locale = Locale.current
        
        return timeFormatter.string(from: convertedDate!)
    }
    
    
    func buildDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E MMM d HH:mm:ss zzz yyyy"
        
        let date_Formatted = formatter.date(from: self)
        formatter.dateFormat = "MMM d, yyyy"
        if let date = date_Formatted {
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedString.Key: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedString.Key: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}


extension UIView {
    
    func addBackground() {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = #imageLiteral(resourceName: "bgAllscreen")
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
    
    class func viewForTitle(title: String, subTitle: String = "") -> UIView {
        let width = UIScreen.main.bounds.size.width - 120.0
        let labelHeight: CGFloat = 20.0
        
        var titleViewHeight = 20.0
        var subTitleLabel: UILabel?
        
        let titleLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: width, height: labelHeight))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.white
        titleLabel.text = title
        
        if subTitle != "" {
            subTitleLabel = UILabel(frame: CGRect(x: 0.0, y: titleLabel.frame.origin.y + labelHeight - 5.0, width: width, height: labelHeight))
            subTitleLabel?.backgroundColor = UIColor.clear
            subTitleLabel?.textAlignment = .center
            subTitleLabel?.text = subTitle
            
            titleViewHeight = 35.0
        }
        
        let titleView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: Double(width), height: titleViewHeight))
        titleView.addSubview(titleLabel)
        if let label = subTitleLabel {
            titleView.addSubview(label)
        }
        return titleView
    }
    
    
    
    func isDirectionInEnglish() -> Bool {
        let attribute = self.semanticContentAttribute
        let layoutDirection = UIView.userInterfaceLayoutDirection(for: attribute)
        if layoutDirection == .rightToLeft {
            return false
        } else {
            return true
        }
    }
    
    
    
    func addGradient() {
        
        self.removeGradient()
        
        let topColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.0)
        let bottomColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.8)
        
        let width = UIScreen.main.bounds.size.width
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: width, height: self.frame.size.height)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func removeGradient() {
        let layers = self.layer.sublayers
        for layer in layers! {
            if layer is CAGradientLayer {
                layer.removeFromSuperlayer()
            }
        }
    }
    
    func addUpperBorder() {
        
        let width = UIScreen.main.bounds.size.width - 24.0
        
        let layer = CALayer()
        layer.backgroundColor = UIColor.green.cgColor
        layer.frame = CGRect(x: 0.0, y: 0.0, width: width, height: 1.0)
        self.layer.addSublayer(layer)
    }
    
    func addBottomBorder() {
        
        let width = UIScreen.main.bounds.size.width - 24.0
        
        let layer = CALayer()
        layer.backgroundColor = UIColor.green.cgColor
        layer.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: width, height: 1.0)
        self.layer.addSublayer(layer)
    }
    
    func addSideBorders() {
        
        let leftLayer = CALayer()
        leftLayer.backgroundColor = UIColor.green.cgColor
        leftLayer.frame = CGRect(x: 0.0, y: 0.0, width: 1.0, height: self.frame.height)
        self.layer.addSublayer(leftLayer)
        
        let rightLayer = CALayer()
        rightLayer.backgroundColor = UIColor.green.cgColor
        rightLayer.frame = CGRect(x: self.frame.width - 1, y: 0.0, width: 1.0, height: self.frame.height)
        self.layer.addSublayer(rightLayer)
    }
    
    func removeLayers() {
        let layers = self.layer.sublayers
        for layer in layers! {
            layer.removeFromSuperlayer()
        }
    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 1
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func showWithFadeAnimation(duration:CGFloat, delay:CGFloat) {
        
        UIView.animate(withDuration: TimeInterval(duration), delay: TimeInterval(delay), options: .transitionCrossDissolve, animations: {() -> Void in
            self.alpha = 1.0
            self.superview?.layoutIfNeeded()
        }, completion: { _ in })
    }
}

extension Date {
    
    init?(jsonDate: String) {
        let prefix = "/Date("
        let suffix = ")/"
        let scanner = Scanner(string: jsonDate)
        
        // Check prefix:
        if scanner.scanString(prefix, into: nil) {
            
            // Read milliseconds part:
            var milliseconds : Int64 = 0
            if scanner.scanInt64(&milliseconds) {
                // Milliseconds to seconds:
                var timeStamp = TimeInterval(milliseconds)/1000.0
                
                // Read optional timezone part:
                var timeZoneOffset : Int = 0
                if scanner.scanInt(&timeZoneOffset) {
                    let hours = timeZoneOffset / 100
                    let minutes = timeZoneOffset % 100
                    // Adjust timestamp according to timezone:
                    timeStamp += TimeInterval(3600 * hours + 60 * minutes)
                }
                
                // Check suffix:
                if scanner.scanString(suffix, into: nil) {
                    // Success! Create NSDate and return.
                    self.init(timeIntervalSince1970: timeStamp)
                    return
                }
            }
        }
        
        // Wrong format, return nil. (The compiler requires us to
        // do an initialization first.)
        self.init(timeIntervalSince1970: 0)
        return nil
    }
    
    func toLocalTime() -> Date {
        let timeZone = NSTimeZone.default
        let seconds = timeZone.secondsFromGMT(for: self)
        let localDate = Date(timeInterval: TimeInterval(seconds), since: self)
        
        let calendar = Calendar(identifier: .gregorian)
        return calendar.startOfDay(for: localDate)
    }
    
    func nextDay() -> Date {
        var dateComponent: DateComponents = DateComponents()
        dateComponent.day = 1
        let nextDayDate = Calendar.current.date(byAdding: dateComponent, to: self)
        
        return nextDayDate!
    }
    
    func previousDay() -> Date {
        var dateComponent: DateComponents = DateComponents()
        dateComponent.day = -1
        let previousDayDate = Calendar.current.date(byAdding: dateComponent, to: self)
        
        return previousDayDate!
    }
    
    func nextMonth() -> Date {
        var dateComponent: DateComponents = DateComponents()
        dateComponent.month = 1
        let nextMonthDate = Calendar.current.date(byAdding: dateComponent, to: self)
        
        return nextMonthDate!
    }
    
    func previousMonth() -> Date {
        var dateComponent: DateComponents = DateComponents()
        dateComponent.month = -1
        let previousMonthDate = Calendar.current.date(byAdding: dateComponent, to: self)
        
        return previousMonthDate!
    }
    
    func nextYear() -> Date {
        var dateComponent: DateComponents = DateComponents()
        dateComponent.year = 1
        let nextMonthDate = Calendar.current.date(byAdding: dateComponent, to: self)
        
        return nextMonthDate!
    }
    
    func formattedDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = formatter.string(from: self)
        
        return formattedDate
    }
    
    func dateAfterDays(days: Int) -> Date {
        var dateComponent: DateComponents = DateComponents()
        dateComponent.day = days
        let newDate = Calendar.current.date(byAdding: dateComponent, to: self)
        
        return newDate!
    }
    
    func numberOfDaysBetweenDate(date: Date) -> Int {
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.day], from: self.toLocalTime(), to: date)
        let numberOfDays = components.day!
        return abs(numberOfDays)
    }
    
}

extension UILabel {
    
    func addShadowEffectToText() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 2.0
        self.layer.backgroundColor = UIColor.clear.cgColor
    }
}

extension UIImage {
    
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

extension UIImageView {
    
    func setImageWithAnimation(imageUrl : URL) {
        
        self.sd_setImage(with: imageUrl, placeholderImage: nil, options: .highPriority, completed: { (image, error, cache, url) in
            
            if imageUrl == url {
                
                if cache == SDImageCacheType.memory {
                    self.image = image
                }
                else {
                    
                    UIView.transition(with: self, duration: 0.8, options: .transitionCrossDissolve, animations: {
                        self.image = image
                    }, completion: nil)
                }
            }
            
        })
    }
}


extension Error {
    
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}


extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}


extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let tabController = controller as? UITabBarController {
            return topViewController(controller: tabController.selectedViewController)
        }
        if let navController = controller as? UINavigationController {
            return topViewController(controller: navController.visibleViewController)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    class func topViewNavigationController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UINavigationController? {
        if let tabController = controller as? UITabBarController {
            return topViewController(controller: tabController.selectedViewController) as? UINavigationController
        }
        if let navController = controller as? UINavigationController {
            return topViewController(controller: navController) as? UINavigationController
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented.navigationController) as? UINavigationController
        }
        return controller as? UINavigationController
    }
}


extension UIAlertController {
    func show() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.windowLevel = UIWindow.Level.alert
        window.makeKeyAndVisible()
        window.rootViewController?.present(self, animated: false, completion: nil)
    }
}

