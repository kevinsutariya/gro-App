//
//  ResponsibilityCell.swift
//  GroApp
//
//  Created by Faisal Saleem on 27/09/2022.
//

import UIKit

class ColorPickerCell: UICollectionViewCell {
    static let identifier: String = "ColorPickerCell"
    
    @IBOutlet weak var colorView: UIView!
    
    func configCellViews(with model: String) {
        self.colorView.backgroundColor = UIColor.init(hex: model)
    }
}
