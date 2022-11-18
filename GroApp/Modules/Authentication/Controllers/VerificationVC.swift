//
//  VerificationVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 23/09/2022.
//

import UIKit

class VerificationVC: UIViewController {

    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var codeField: UITextField!
    @IBOutlet weak var verifyBtn: UIButton!
    @IBOutlet weak var errorMessageLbl: UILabel!
    @IBOutlet weak var timeDurationLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTabResendCode(_ sender: UIButton) {
    }
    
    @IBAction func didTabFloatingBtn(_ sender: UIButton) {
        let vc = NewPasswordVC.initFromStoryboard(.NewPassword)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
