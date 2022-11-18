//
//  TaskScheduleCell.swift
//  GroApp
//
//  Created by Faisal Saleem on 29/09/2022.
//

import UIKit

class TaskScheduleCell: UICollectionViewCell {
    static let identifier: String = "TaskScheduleCell"
    
    @IBOutlet weak var scheduleView: UIView!
    @IBOutlet weak var calendersView: UIView!
    @IBOutlet weak var schdeuleTimeLbl: UILabel!
    @IBOutlet weak var calenderIcon: UIImageView!
    @IBOutlet weak var calenderNameLbl: UILabel!
    
    func configCellViews(with item: String) {
        
    }
}
