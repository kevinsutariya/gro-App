//
//  SuccessVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 25/09/2022.
//

import UIKit

class SuccessVC: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTabContinue(_ sender: UIButton) {
        self.descriptionLbl.text = "Alex signed up with your referral code. You have received a free month of premium!"
    }
}
