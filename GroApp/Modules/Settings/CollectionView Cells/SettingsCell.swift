//
//  SettingsCell.swift
//  GroApp
//
//  Created by Faisal Saleem on 29/09/2022.
//

import UIKit

class SettingsCell: UICollectionViewCell {
    static let identifier: String = "SettingsCell"
    
    @IBOutlet weak var titleLbl: UILabel!
    
    func configCellViews(with item: String) {
        self.titleLbl.text = item
    }
}
