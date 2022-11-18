//
//  SignUpVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 22/09/2022.
//

import UIKit

enum SecureFieldEnum {
    static var eyeFill = UIImage(systemName: "eye.fill")!
    static var eyeSlashFill = UIImage(systemName: "eye.slash.fill")!
}

class SignUpVC: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var eyeBtn: UIButton!
    @IBOutlet weak var passwordTopConstraints: NSLayoutConstraint!
    @IBOutlet weak var usernameStatusIcon: UIButton!
    @IBOutlet weak var usernameMessageLbl: UILabel!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameStatusIcon.isHidden = true
        self.usernameField.delegate = self
    }
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTabEye(_ sender: UIButton) {
        self.passwordField.isSecureTextEntry = !self.passwordField.isSecureTextEntry
        let icon = self.passwordField.isSecureTextEntry ? SecureFieldEnum.eyeFill : SecureFieldEnum.eyeSlashFill
        self.eyeBtn.setImage(icon, for: .normal)
    }
    
}

extension SignUpVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (self.usernameField.text ?? "").count > 0 {
            self.passwordTopConstraints.constant = 30
            self.usernameMessageLbl.isHidden = false
            self.usernameStatusIcon.isHidden = false
            self.usernameStatusIcon.setImage(UIImage(named: "crossIcon"), for: .normal)
        } else {
            self.usernameStatusIcon.isHidden = true
            self.passwordTopConstraints.constant = 10
            self.usernameMessageLbl.isHidden = true
            self.usernameStatusIcon.setImage(UIImage(named: "tickIcon"), for: .normal)
        }
        
    }
}
