//
//  Util.swift
//  عيسى الهولي
//
//  Created by Eng Angelo E Saber on 1/7/19.
//  Copyright © 2019 MacBook. All rights reserved.
//

import Foundation
import UIKit



public class Util {
    class func  screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    class func  screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }

    
    class func showErrorAlert(caller:UIViewController,message:String) -> Void {
        Util.showAlert(caller: caller, title: "Error", message: message)
        
    }
    
    class func showAlert(caller:UIViewController,title:String?,message:String) -> Void {
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            caller.present(alert, animated: true, completion: nil)
        }
    }
    
    class func showAlertWithButton(caller:UIViewController,title: String, message: String,buttonTitle:String = "Cancel" ,buttonStyle: UIAlertAction.Style = UIAlertAction.Style.cancel , buttonHandler: ((UIAlertAction) -> Void)? = nil ) -> Void {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message:message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: buttonTitle, style: buttonStyle, handler:buttonHandler))
            caller.present(alert, animated: true, completion: {
            })
        }
    }
    
    class func showAlertWithTwoButtons(caller:UIViewController,title: String, message: String,firstButtonTitle:String = "Cancel" ,firstButtonStyle: UIAlertAction.Style = UIAlertAction.Style.cancel , firstButtonHandler: ((UIAlertAction) -> Void)? = nil , secondButtonTitle: String,secondButtonStyle: UIAlertAction.Style = UIAlertAction.Style.cancel , secondButtonHandler: ((UIAlertAction) -> Void)? = nil ) -> Void {
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message:message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler:firstButtonHandler))
            alert.addAction(UIAlertAction(title: secondButtonTitle, style: secondButtonStyle, handler:secondButtonHandler))
            
            caller.present(alert, animated: true, completion: {
            })
        }
    }
    
    
    
    class func showAlertWithThreeButtons(caller:UIViewController,title: String, message: String,firstButtonTitle:String ,firstButtonStyle: UIAlertAction.Style = UIAlertAction.Style.default , firstButtonHandler: ((UIAlertAction) -> Void)? = nil , secondButtonTitle: String,secondButtonStyle: UIAlertAction.Style = UIAlertAction.Style.default , secondButtonHandler: ((UIAlertAction) -> Void)? = nil, thirdButtonTitle: String,thirdButtonStyle: UIAlertAction.Style = UIAlertAction.Style.default , thirdButtonHandler: ((UIAlertAction) -> Void)? = nil ) -> Void {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message:message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler:firstButtonHandler))
            alert.addAction(UIAlertAction(title: secondButtonTitle, style: secondButtonStyle, handler:secondButtonHandler))
            alert.addAction(UIAlertAction(title: thirdButtonTitle, style: thirdButtonStyle, handler:thirdButtonHandler))
            
            caller.present(alert, animated: true, completion: {
            })
        }
    }
    
    
    class func showTextFieldAlertWithTwoButtons(caller:UIViewController,title: String, message: String,configurationTextField:((UITextField) -> Swift.Void)? = nil,firstButtonTitle:String = "Cancel" ,firstButtonStyle: UIAlertAction.Style = UIAlertAction.Style.cancel , firstButtonHandler: ((UIAlertAction) -> Void)? = nil , secondButtonTitle: String,secondButtonStyle: UIAlertAction.Style = UIAlertAction.Style.cancel , secondButtonHandler: ((UIAlertAction) -> Void)? = nil ) -> Void {
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message:message, preferredStyle: .alert)
            alert.addTextField(configurationHandler: configurationTextField)
            
            alert.addAction(UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler:firstButtonHandler))
            alert.addAction(UIAlertAction(title: secondButtonTitle, style: secondButtonStyle, handler:secondButtonHandler))
            
            caller.present(alert, animated: true, completion: {
            })
        }
    }
    
    
    class func showTwoTextFieldWithTwoButtons(caller:UIViewController,title: String, message: String,firstTextFieldConfiguration:((UITextField) -> Swift.Void)? = nil, secondTextFieldConfiguration:((UITextField) -> Swift.Void)? = nil  ,firstButtonTitle:String = "Cancel" ,firstButtonStyle: UIAlertAction.Style = UIAlertAction.Style.cancel , firstButtonHandler: ((UIAlertAction) -> Void)? = nil , secondButtonTitle: String,secondButtonStyle: UIAlertAction.Style = UIAlertAction.Style.cancel , secondButtonHandler: ((UIAlertAction) -> Void)? = nil ) -> Void {
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message:message, preferredStyle: .alert)
            alert.addTextField(configurationHandler: firstTextFieldConfiguration)
            alert.addTextField(configurationHandler: secondTextFieldConfiguration)
            alert.addAction(UIAlertAction(title: firstButtonTitle, style: firstButtonStyle, handler:firstButtonHandler))
            alert.addAction(UIAlertAction(title: secondButtonTitle, style: secondButtonStyle, handler:secondButtonHandler))
            caller.present(alert, animated: true, completion: {
            })
        }
    }
    
    class func showTextFieldAlertButton(caller:UIViewController,title: String, message: String,configurationTextField:((UITextField) -> Swift.Void)? = nil,buttonTitle:String = "Cancel" ,buttonStyle: UIAlertAction.Style = UIAlertAction.Style.cancel , buttonHandler: ((UIAlertAction) -> Void)? = nil ) -> Void {
        
        DispatchQueue.main.async {
            
            let alert = UIAlertController(title:title, message:message, preferredStyle: .alert)
            alert.addTextField(configurationHandler: configurationTextField)
            
            alert.addAction(UIAlertAction(title: buttonTitle, style: buttonStyle, handler:buttonHandler))
            
            caller.present(alert, animated: true, completion: {
            })
        }
    }
    
    class func showToast(vc: UIViewController, message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
        alert.view.layer.cornerRadius = 15
        vc.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            alert.dismiss(animated: true)
        }
    }
    
    static func getCurrentMillis() -> String {
        return String(Int64(Date().timeIntervalSince1970 * 1000))
      }
      static func getMillis(_ date: Date) -> String {
        return String(Int64(date.timeIntervalSince1970 * 1000))
      }
      static func getMillis() -> Int64 {
        return Int64(Date().timeIntervalSince1970 * 1000)
      }
      static func buildDatefromMillis(millis: String) -> Date? {
        if !millis.isEmpty {
          if let interval = TimeInterval(millis) {
            return Date(timeIntervalSince1970: interval / 1000)
          }
        }
        return nil
      }
      static func formatDate(_ fm: String, dt: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = fm
        return df.string(from: dt)
      }
    
    static func stringToDate(_ stringDate: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let converted = formatter.date(from: stringDate)
        return converted
    }
        
    class func combineStrings(other: String, mine: String) -> String {
        var chat_id = ""
        if other.compare(mine).rawValue > 0 {
            chat_id = other + "_&_" + mine
        } else {
            chat_id = mine + "_&_" + other
        }
        return chat_id
    }
    
   static func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ssZ", dateString: String) -> Date? {
       let formatter = DateFormatter()
       formatter.locale = Locale(identifier: "en_US_POSIX")
       formatter.dateFormat = format
       if let date = formatter.date(from: dateString) {
           return date
       }
       return nil
   }
}

