//
//  InspectableView.swift
//  Version3
//
//  Created by M Abdullah Waseer on 03/04/2018.
//  Copyright © 2017 M Abdullah Waseer. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    
    @IBInspectable
    var TopleftCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft], cornerRadii: CGSize(width: newValue, height: newValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            return layer.mask = mask
        }
    }
    
    @IBInspectable
    var BottomleftCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft], cornerRadii: CGSize(width: newValue, height: newValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            return layer.mask = mask
        }
    }
    
    @IBInspectable
    var TopRightCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight], cornerRadii: CGSize(width: newValue, height: newValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            return layer.mask = mask
        }
    }
    
    @IBInspectable
    var BottomRightCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomRight], cornerRadii: CGSize(width: newValue, height: newValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            return layer.mask = mask
        }
    }
    
    @IBInspectable
    var LeftSideCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: newValue, height: newValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            return layer.mask = mask
        }
    }
    
    @IBInspectable
    var RightSideCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: newValue, height: newValue))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            return layer.mask = mask
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
