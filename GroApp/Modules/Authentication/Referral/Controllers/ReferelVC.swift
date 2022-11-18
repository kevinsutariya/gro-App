//
//  ReferelVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 24/09/2022.
//

import UIKit

class ReferelVC: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    var didTabCreate: ((Bool) -> Void)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTabSkip(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func didTabEnter(_ sender: UIButton) {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else {return}
            self.didTabCreate(true)
        }
        
    }
}
