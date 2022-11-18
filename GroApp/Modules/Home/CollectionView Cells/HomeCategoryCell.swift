//
//  HomeCategoryCell.swift
//  GroApp
//
//  Created by Faisal Saleem on 25/09/2022.
//

import UIKit

class HomeCategoryCell: UICollectionViewCell {
    static let identifier: String = "HomeCategoryCell"
    
    @IBOutlet weak var iconImage: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    func configCellViews(with model: HomeCategoryModel) {
        self.iconImage.setImage(UIImage(named: model.image), for: .normal)
        self.titleLbl.text = model.title
    }
}
