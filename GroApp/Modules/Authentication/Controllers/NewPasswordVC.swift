//
//  NewPasswordVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 23/09/2022.
//

import UIKit

class NewPasswordVC: UIViewController {

    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTabSet(_ sender: UIButton) {
      
    }
    
}
