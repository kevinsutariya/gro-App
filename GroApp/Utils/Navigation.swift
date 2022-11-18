//
//  Navigation.swift
//  The Black Wall Street UK
//
//  Created by codegradients on 03/05/2021.
//

import Foundation
import UIKit

enum AppStoryboard : String {
  case TaskSchedule, Main, Authentication, OnBoarding, Home, Task, Suggested, Settings, Premium, LMS, Referral, NewPassword, Accomplish
    
    
  var shared : UIStoryboard {
    return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
  }
    
}

extension UIViewController {
    static func initFromStoryboard(_ board: AppStoryboard) -> UIViewController {
        return board.shared.instantiateViewController(withIdentifier: "\(self)")
    }
}
