//
//  HomeOrderCell.swift
//  GroApp
//
//  Created by Faisal Saleem on 01/10/2022.
//

import UIKit

class HomeOrderCell: UITableViewCell {

    @IBOutlet weak var lineView: UIView!
    static let identifier: String = "HomeOrderCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configCellViews(with item: String) {
        
    }

}
