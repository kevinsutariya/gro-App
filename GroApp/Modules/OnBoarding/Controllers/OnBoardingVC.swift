//
//  OnBoardingVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 24/09/2022.
//

import UIKit

struct OnBoardingModel {
    let title: String
    let description: String
}

extension OnBoardingModel {
    static var screens: [OnBoardingModel] = [
    OnBoardingModel(title: "Responsibility", description: "A responsibility is an area of focus."),
    OnBoardingModel(title: "Folder", description: "Responsibilities can be organized in a folder."),
    OnBoardingModel(title: "Task", description: "Responsibilities are broken into tasks."),
    OnBoardingModel(title: "Gro Factor", description: "The Gro Factor is a 0 - 100 point scale that measures return on time."),
    OnBoardingModel(title: "Table", description: "Tasks are displayed in a table. The table above sorts tasks by soonest due date."),
    OnBoardingModel(title: "Smart Order", description: "Smart Order ranks task from highest to lowest by Gro Factor."),
    OnBoardingModel(title: "Home Screen Menu", description: "The number inside daily view is how many tasks are remaining for today. The goal is to get it to zero by the end of the day."),
    OnBoardingModel(title: "Daily", description: "Progress increases as tasks are completed. Streak is how many days in a row at least one task is completed."),
    OnBoardingModel(title: "Daily", description: "Schedule shows the events in your Google, Apple, or Outlook calendar."),
    OnBoardingModel(title: "Monthly", description: "Daily progress is saved in the monthly view. Green checks mean all tasks were accomplished that day.")
    ]
}


class OnBoardingVC: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private lazy var onboardingModel = OnBoardingModel.screens
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
}

extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: self.view.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.onboardingModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCell.identifier, for: indexPath) as! OnBoardingCell
        cell.skipBtn.tag = indexPath.item
        cell.delegate = self
        cell.skipBtn.setTitle(indexPath.item == 9 ? "Start" : "Skip", for: .normal)
        cell.configCellViews(with: self.onboardingModel[indexPath.item], index: indexPath.item)
        return cell
    }
    
}

extension OnBoardingVC: CellDelegate {
    func didTabBtn(with index: Int) {
        let vc = LoginSelectionVC.initFromStoryboard(.Authentication)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
