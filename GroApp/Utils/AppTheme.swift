//
//  AppTheme.swift
//  nextgen
//
//  Created by Faisal Saleem on 20/08/2021.
//

import Foundation
import UIKit

class AppFonts: NSObject {
   
// MARK: - Application Fonts
    static func HeavyFont(fontSize: CGFloat) -> UIFont{
        return UIFont(name: "Montserrat-ExtraBold", size: fontSize)!
    }
    
    static func boldFont(fontSize: CGFloat) -> UIFont{
        return UIFont(name: "Montserrat-Bold", size: fontSize)!
    }
    
    static func semiBoldFont(fontSize: CGFloat) -> UIFont{
        return UIFont(name: "Montserrat-SemiBold", size: fontSize)!
    }
    
    static func mediumFont(fontSize: CGFloat) -> UIFont{
        return UIFont(name: "Montserrat-Medium", size: fontSize)!
    }
    
    static func regularFont(fontSize: CGFloat) -> UIFont{
        return UIFont(name: "Montserrat-Regular", size: fontSize)!
    }
    
}
