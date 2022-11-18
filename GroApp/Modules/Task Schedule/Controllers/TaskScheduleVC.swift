//
//  TaskScheduleVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 29/09/2022.
//

import UIKit

class TaskScheduleVC: UIViewController {

    @IBOutlet weak var taskTitleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var numberOfTaskLbl: UILabel!
    @IBOutlet weak var checkMarkImage: UIImageView!
    
    @IBOutlet weak var scheduleCollectionView: UICollectionView!
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [scheduleCollectionView, resultCollectionView].forEach { collectionView in
            collectionView?.delegate = self
            collectionView?.dataSource = self
        }
        
    }

    @IBAction func didTabClose(_ sender: UIButton) {
        
    }
    
    @IBAction func didTabAdd(_ sender: UIButton) {
    }
}

extension TaskScheduleVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = collectionView == self.scheduleCollectionView ? 36 : 60
        return CGSize(width: UIScreen.main.bounds.width - 40, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.scheduleCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskScheduleCell.identifier, for: indexPath) as! TaskScheduleCell
            cell.configCellViews(with: "Order model item")
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleResultCell.identifier, for: indexPath) as! ScheduleResultCell
            cell.configCellViews(with: "")
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.scheduleCollectionView {
            let vc = GroFactorVC.initFromStoryboard(.TaskSchedule)
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = ReferralCodeVC.initFromStoryboard(.TaskSchedule)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
