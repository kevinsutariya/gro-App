//
//  SignInVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 22/09/2022.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var eyeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didBacktapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapCreateAccount(_ sender: UIButton) {
        let vc = SignUpVC.initFromStoryboard(.Authentication)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTabEye(_ sender: UIButton) {
        self.passwordField.isSecureTextEntry = !self.passwordField.isSecureTextEntry
        let icon = self.passwordField.isSecureTextEntry ? SecureFieldEnum.eyeFill : SecureFieldEnum.eyeSlashFill
        self.eyeBtn.setImage(icon, for: .normal)
    }
    
    @IBAction func didTabForgotPassword(_ sender: UIButton) {
        
        let vc = ForgotPasswordVC.initFromStoryboard(.TaskSchedule)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTabLogin(_ sender: UIButton) {
        let vc = HomeVC.initFromStoryboard(.Home)
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
}
