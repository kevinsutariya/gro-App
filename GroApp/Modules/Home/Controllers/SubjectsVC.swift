//
//  SubjectsVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 25/09/2022.
//

import UIKit

class SubjectsVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var model: [HomeCategoryModel] = [
    HomeCategoryModel(title: "Math", image: "mathIcon"),
    HomeCategoryModel(title: "English", image: "englishIcon"),
    HomeCategoryModel(title: "Science", image: "scienceIcon"),
    HomeCategoryModel(title: "History", image: "historyIcon"),
    HomeCategoryModel(title: "Spanish", image: "spanishIcon"),
    HomeCategoryModel(title: "Other", image: "otherIcon")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    @IBAction func didTabClose(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

extension SubjectsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (UIScreen.main.bounds.width - 144) / 3, height: 98)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryCell.identifier, for: indexPath) as! HomeCategoryCell
        cell.configCellViews(with: self.model[indexPath.item])
        return cell
        
    }
}
