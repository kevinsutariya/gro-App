//
//  AppButton.swift
//  faxapp
//
//  Created by Faisal Saleem on 25/12/2021.
//

import Foundation
import UIKit

@IBDesignable
final class AppButton: UIButton {

    override public func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
    }
    
    override internal func awakeFromNib() {
        buttonSetup()
    }

    func buttonSetup() {
//        layer.backgroundColor = UIColor.buttonsPrimary.cgColor
        self.titleLabel?.font = AppFonts.mediumFont(fontSize: 13)
        self.titleLabel?.textColor = .white
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 17
    }
}
