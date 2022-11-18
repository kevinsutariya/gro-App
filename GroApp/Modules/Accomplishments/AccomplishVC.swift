//
//  AccomplishVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 04/10/2022.
//

import UIKit

class AccomplishVC: UIViewController {


    @IBOutlet weak var taskCollectionView: UICollectionView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [self.collectionView, self.taskCollectionView].forEach { CV in
            CV?.delegate = self
            CV?.dataSource = self
        }
    }
    
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension AccomplishVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = collectionView == self.collectionView ? 36 : 60
        return CGSize(width: collectionView == self.collectionView ? (UIScreen.main.bounds.width - 40) / 7 :UIScreen.main.bounds.width - 40, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccomplishResponsibilityCell.identifier, for: indexPath) as! AccomplishResponsibilityCell
            cell.configCellViews(with: "Order model item")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleResultCell.identifier, for: indexPath) as! ScheduleResultCell
            cell.configCellViews(with: "")
            return cell
        }
        
    }
}
