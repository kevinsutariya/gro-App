//
//  PremiumFeaturesVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 29/09/2022.
//

import UIKit

class PremiumFeaturesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var premiumList: [String] = [
    "Gro Factor", "Smart Order", "Unlimited tasks", "Unlimited responsibilities", "Custom appearance", "Unreleased features", "No ads"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        
    }
}


extension PremiumFeaturesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.premiumList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PremiumFeaturesCell.identifier, for: indexPath) as! PremiumFeaturesCell
        cell.configCellViews(with: self.premiumList[indexPath.item])
            return cell
    }
}
