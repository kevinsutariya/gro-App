//
//  ResponsibilityVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 27/09/2022.
//

import UIKit

class ResponsibilityVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var iconsCollectionView: UICollectionView!
    
    private lazy var colors: [String] = [
        "4C687A", "96908E", "F3DBA1", "DB9261", "8DBCA1", "C4C6A8", "846F5E", "514D4B", "ABBCBA", "F2E0D2", "D9A3A3"
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        [self.collectionView, self.iconsCollectionView].forEach { cvView in
            cvView?.delegate = self
            cvView?.dataSource = self
        }

    }
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTabSave(_ sender: UIButton) {
    }
}

extension ResponsibilityVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 42, height: 42)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorPickerCell.identifier, for: indexPath) as! ColorPickerCell
            cell.configCellViews(with: self.colors[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IconPickerCell.identifier, for: indexPath) as! IconPickerCell
//            cell.configCellViews(with: self.colors[indexPath.item])
            return cell
        }
        
        
    }
}
