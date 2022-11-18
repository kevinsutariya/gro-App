//
//  PremiumFeaturesCell.swift
//  GroApp
//
//  Created by Faisal Saleem on 29/09/2022.
//

import UIKit

class PremiumFeaturesCell: UICollectionViewCell {
    static let identifier: String = "PremiumFeaturesCell"
    
    @IBOutlet weak var titleLbl: UILabel!
    
    func configCellViews(with item: String) {
        self.titleLbl.text = item
    }
}
