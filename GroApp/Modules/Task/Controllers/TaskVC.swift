//
//  TaskVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 26/09/2022.
//

//https://github.com/Ramotion/folding-cell

import UIKit


struct TaskModel {
    let icon: String
    let title: String
    var time: String = ""
    var add: Bool = true
    var isShowSubView: Bool = false
}

extension TaskModel {
    static var model: [TaskModel] = [
    TaskModel(icon: "responsibilityIcon", title: "Responsibility"),
    TaskModel(icon: "dateIcon", title: "Due Date"),
    TaskModel(icon: "bellIcon", title: "Notification", time: "1 hour before", add: false),
    TaskModel(icon: "clockIcon", title: "How Long"),
    TaskModel(icon: "topArrowIcon", title: "Priority Level"),
    TaskModel(icon: "linkIcon", title: "Link"),
    TaskModel(icon: "emptyStarIcon", title: "Star"),
    TaskModel(icon: "menuIcon", title: "Add Notes")
    ]
}

class TaskVC: UIViewController {
    
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var notificationMainViewHeight: NSLayoutConstraint!
    @IBOutlet weak var notificationInnerViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var didSelectIndex = -1
    private var taskModel = TaskModel.model
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    @IBAction func didTabClose(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTabSave(_ sender: UIButton) {
        let vc = SuggestedVC.initFromStoryboard(.Suggested)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension TaskVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = self.didSelectIndex == indexPath.item ? 200 : 52
        return CGSize(width: UIScreen.main.bounds.width - 40, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.taskModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCell.identifier, for: indexPath) as! TaskCell
        cell.delegate = self
        self.taskModel[indexPath.item].isShowSubView = self.didSelectIndex == indexPath.item ? false : true
        cell.configCellViews(with: self.taskModel[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            let vc = TaskSubjectsVC.initFromStoryboard(.Task)
            vc.modalPresentationStyle = .custom
            self.present(vc, animated: true)
        } else {
            self.didSelectIndex = self.didSelectIndex == indexPath.item ? -1 : indexPath.item
            self.collectionView.reloadData()
        }
        
    }
    
}

extension TaskVC: TaskCellDelegate {
    func didBtnTapped(with index: Int) {
        self.collectionView.reloadData()
    }
}
