//
//  IconPickerCell.swift
//  GroApp
//
//  Created by Faisal Saleem on 27/09/2022.
//

import UIKit

class IconPickerCell: UICollectionViewCell {
    static let identifier: String = "IconPickerCell"
    
    @IBOutlet weak var restIcon: UIImageView!
    
    func configCellViews(with icon: String) {
//        self.restIcon.image = UIImage(named: "IconPickerCell")
    }
}
