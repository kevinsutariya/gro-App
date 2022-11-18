//
//  ForgotPasswordVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 22/09/2022.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var flagBtn: UIButton!
    @IBOutlet weak var usingEmailBtn: UIButton!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var numberView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTabFlag(_ sender: UIButton) {
        
    }
    
    @IBAction func didTabNext(_ sender: UIButton) {
        let vc = VerificationVC.initFromStoryboard(.NewPassword)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTabUsingEmail(_ sender: UIButton) {
        self.emailView.isHidden = !self.emailView.isHidden
        self.numberView.isHidden = !self.emailView.isHidden
        self.subtitleLbl.text = self.emailView.isHidden ? "Enter your number" : "Enter your email"
        self.usingEmailBtn.setTitle(self.emailView.isHidden ? "Reset Password Using Email" : "Reset Password Using Number", for: .normal)
    }
}
