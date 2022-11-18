//
//  UIColor+Extensions.swift
//  nextgen
//
//  Created by Apple on 8/21/21.
//

import UIKit

extension UIColor {
    static var buttonsPrimary: UIColor = UIColor(named: "buttonsPrimary")!
    static var buttonsSecondary: UIColor = UIColor(named: "buttonsSecondary")!
    static var fieldsBackground: UIColor = UIColor(named: "fieldsBackground")!
    static var textSecondary: UIColor = UIColor(named: "textSecondary")!
    
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
