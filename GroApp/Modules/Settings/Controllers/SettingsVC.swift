//
//  SettingsVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 29/09/2022.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var settings: [String] = [
    "Appearance", "Smart Order", "Accomplishments", "Ambassador Program", "Folders", "Defaults", "Gro Factor", "Premium", "Referral program", "Feedback", "Help", "Logout"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}


extension SettingsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        cell.configCellViews(with: self.settings[indexPath.item])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PremiumFeaturesVC.initFromStoryboard(.Premium)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

