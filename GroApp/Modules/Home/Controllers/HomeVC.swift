//
//  HomeVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 25/09/2022.
//

//https://github.com/kciter/Floaty

import UIKit

struct HomeCategoryModel {
    let title: String
    let image: String
}

extension HomeCategoryModel {
    static let model: [HomeCategoryModel] = [
        HomeCategoryModel(title: "School", image: "schoolIcon"),
        HomeCategoryModel(title: "Family", image: "familyIcon"),
        HomeCategoryModel(title: "Diet", image: "dietIcon"),
        HomeCategoryModel(title: "Settings", image: "settingsIcon")
    ]
}

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tableViewContainerHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableViewContainerHeight.constant = (10 * 60)
        self.containerViewHeight.constant = 400 + (10 * 65)
        
        let storyboard = UIStoryboard(name: "TaskSchedule", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "StoryboardID")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func didTabCalender(_ sender: UIButton) {
        let vc = TaskVC.initFromStoryboard(.Task)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTabSchool(_ sender: UIButton) {
        
    }
    
    @IBAction func didTabFamily(_ sender: UIButton) {
        
    }
    
    @IBAction func didTabDiet(_ sender: UIButton) {
        
    }
    
    @IBAction func didTabSettings(_ sender: UIButton) {
        
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 120) / 3, height: 98)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeCategoryModel.model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryCell.identifier, for: indexPath) as! HomeCategoryCell
            cell.configCellViews(with: HomeCategoryModel.model[indexPath.item])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = SubjectsVC.initFromStoryboard(.Home)
        vc.modalPresentationStyle = .custom
        self.present(vc, animated: true)
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeOrderCell.identifier, for: indexPath) as! HomeOrderCell
        cell.lineView.isHidden = indexPath.item == 9 ? true : false
        cell.configCellViews(with: "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          
//        self.tableView.deleteRows(at: [indexPath], with: .automatic)
      }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaskScheduleVC.initFromStoryboard(.TaskSchedule)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
