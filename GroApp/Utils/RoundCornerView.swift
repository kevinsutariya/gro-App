//
//  RoundCornerView.swift
//  BennyBoy
//
//  Created by Muhammad Umair on 30/01/2020.
//  Copyright © 2020 Code Gradients. All rights reserved.
//

import UIKit

@IBDesignable
class RoundCornerView: UIView {
    
    var corners: CACornerMask!
    
    @IBInspectable var topRight: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var topLeft: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomRight: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomLeft: Bool = false {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var radius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        corners = []
        
        if topRight {
            corners.insert(.layerMaxXMinYCorner)
        } else {
            corners.remove(.layerMaxXMinYCorner)
        }
        
        if topLeft {
            corners.insert(.layerMinXMinYCorner)
        } else {
            corners.remove(.layerMinXMinYCorner)
        }
        
        if bottomRight {
            corners.insert(.layerMaxXMaxYCorner)
        } else {
            corners.remove(.layerMaxXMaxYCorner)
        }
        
        if bottomLeft {
            corners.insert(.layerMinXMaxYCorner)
        } else {
            corners.remove(.layerMinXMaxYCorner)
        }
        
        layer.maskedCorners = corners
        layer.cornerRadius = radius
    }
    
}
