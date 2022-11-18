//
//  OnBoardingCell.swift
//  GroApp
//
//  Created by Faisal Saleem on 24/09/2022.
//

import UIKit

protocol CellDelegate {
    func didTabBtn(with index: Int)
}
class OnBoardingCell: UICollectionViewCell {
    static let identifier: String = "OnBoardingCell"
    
    var delegate: CellDelegate?
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var pageControlImage: UIImageView!
    
    func configCellViews(with item: OnBoardingModel, index: Int) {
        self.titleLbl.text = item.title
        self.image.image = UIImage(named: "OBImage\(index + 1)")
        self.descriptionLbl.text = item.description
        self.pageControlImage.image = UIImage(named: "pageControl\(index + 1)")
    }
    
    @IBAction func didTabSkip(_ sender: UIButton) {
        self.delegate?.didTabBtn(with: self.skipBtn.tag)
    }
    
}
