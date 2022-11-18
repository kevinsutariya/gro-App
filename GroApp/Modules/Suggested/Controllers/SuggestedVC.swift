//
//  SuggestedVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 27/09/2022.
//

import UIKit

enum SuggestedEnum: Int {
    case school = 0
    case hobbies = 1
    case misc = 2
}

class SuggestedVC: UIViewController {
    
    @IBOutlet weak var schoolBtn: UIButton!
    @IBOutlet weak var hobbiesBtn: UIButton!
    @IBOutlet weak var miscBtn: UIButton!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private lazy var model: [HomeCategoryModel] = [
    HomeCategoryModel(title: "Math", image: "mathIcon"),
    HomeCategoryModel(title: "English", image: "englishIcon"),
    HomeCategoryModel(title: "Science", image: "scienceIcon"),
    HomeCategoryModel(title: "History", image: "historyIcon"),
    HomeCategoryModel(title: "Spanish", image: "spanishIcon"),
    HomeCategoryModel(title: "Greek", image: "greekIcon"),
    HomeCategoryModel(title: "GRS", image: "grsIcon"),
    HomeCategoryModel(title: "AHC", image: "ahcIcon"),
    HomeCategoryModel(title: "PSF", image: "psfIcon")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didTabSegmented(_ sender: UIButton) {
        let currentBtn = SuggestedEnum(rawValue: sender.tag) ?? .school
        switch currentBtn {
            case .school:
                self.updateSegmentedUI(with: self.schoolBtn)
            case .hobbies:
                self.updateSegmentedUI(with: self.hobbiesBtn)
            case .misc:
                self.updateSegmentedUI(with: self.miscBtn)
        }
    }
    
    fileprivate func updateSegmentedUI(with currentBtn: UIButton) {
        [self.schoolBtn, self.hobbiesBtn, self.miscBtn].forEach { btn in
            btn?.backgroundColor = .clear
            btn?.setTitleColor(.black, for: .normal)
        }
        
        currentBtn.backgroundColor = UIColor.buttonsPrimary
        currentBtn.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func didTabCustom(_ sender: UIButton) {
        let vc = ResponsibilityVC.initFromStoryboard(.Suggested)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SuggestedVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
