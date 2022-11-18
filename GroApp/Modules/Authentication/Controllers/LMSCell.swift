//
//  LMSCell.swift
//  GroApp
//
//  Created by Faisal Saleem on 01/10/2022.
//

import UIKit

class LMSCell: UICollectionViewCell {
    
    static let identifier: String = "LMSCell"
    
    @IBOutlet weak var lmsIcon: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    func configCellViews(with item: LMSModel) {
        self.lmsIcon.image = UIImage(named: item.icon)
        self.titleLbl.text = item.title
    }
}
