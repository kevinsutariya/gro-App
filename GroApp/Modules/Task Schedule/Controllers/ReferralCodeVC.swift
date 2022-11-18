//
//  ReferralCodeVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 29/09/2022.
//

import UIKit

class ReferralCodeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapInviteFriends(_ sender: UIButton) {
        let vc = SettingsVC.initFromStoryboard(.Settings)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
