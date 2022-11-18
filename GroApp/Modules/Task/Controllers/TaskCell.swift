//
//  TaskCell.swift
//  GroApp
//
//  Created by Faisal Saleem on 26/09/2022.
//

import UIKit

protocol TaskCellDelegate {
    func didBtnTapped(with index: Int)
}

enum HowLongEnum: Int {
    case thirtyMin  = 0
    case oneHour    = 1
    case twoHour    = 2
    case fourHour   = 3
    case custom     = 4
}

class TaskCell: UICollectionViewCell {
    static let identifier: String = "TaskCell"
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var thirtyMinBtn: UIButton!
    @IBOutlet weak var oneHourBtn: UIButton!
    @IBOutlet weak var twoHourBtn: UIButton!
    @IBOutlet weak var fourHourBtn: UIButton!
    @IBOutlet weak var customBtn: UIButton!
    
    var delegate: TaskCellDelegate?
    
    func configCellViews(with model: TaskModel) {
        self.innerView.isHidden = model.isShowSubView
        self.iconImage.image = UIImage(named: model.icon)
        self.titleLbl.text = model.title
        self.plusBtn.isHidden = !model.add
        self.timeLbl.text = model.time
        self.timeLbl.isHidden = model.add
        
        
    }
    
    @IBAction func didTabPlus(_ sender: UIButton) {
        
    }
    
    @IBAction func didTabHowLong(_ sender: UIButton) {
        self.howLongView(btn: HowLongEnum(rawValue: sender.tag) ?? .thirtyMin)
    }
    
    func howLongView(btn: HowLongEnum) {
        switch btn {
            case .thirtyMin:
                self.howLongBtnUI(with: self.thirtyMinBtn)
            case .oneHour:
                self.howLongBtnUI(with: self.oneHourBtn)
            case .twoHour:
                self.howLongBtnUI(with: self.twoHourBtn)
            case .fourHour:
                self.howLongBtnUI(with: self.fourHourBtn)
            case .custom:
                self.howLongBtnUI(with: self.customBtn)
        }
    }
    
    func howLongBtnUI(with btn: UIButton) {
        [self.thirtyMinBtn, self.oneHourBtn, self.twoHourBtn, self.fourHourBtn, self.customBtn].forEach { btn in
            btn?.setTitleColor(UIColor.darkGray, for: .normal)
            btn?.backgroundColor = .clear
        }
        btn.backgroundColor = UIColor.buttonsPrimary
        btn.setTitleColor(UIColor.white, for: .normal)
        
        self.delegate?.didBtnTapped(with: btn.tag)
    }
}
