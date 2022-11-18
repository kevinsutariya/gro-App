//
//  LMSVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 01/10/2022.
//

import UIKit

struct LMSModel {
    let icon: String
    let title: String
}

extension LMSModel {
    static var items: [LMSModel] = [
    LMSModel(icon: "blackboardIcon", title: "Blackboard"),
    LMSModel(icon: "D2LIcon", title: "Desire2Learn"),
    LMSModel(icon: "edmodoIcon", title: "Edmodo"),
    LMSModel(icon: "googleClassroomIcon", title: "Google Classroom"),
    LMSModel(icon: "moodleIcon", title: "Moodle"),
    LMSModel(icon: "schoologyIcon", title: "Schoology")
    ]
}
class LMSVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension LMSVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 40, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LMSModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LMSCell.identifier, for: indexPath) as! LMSCell
        cell.configCellViews(with: LMSModel.items[indexPath.item])
            return cell
    }
}
