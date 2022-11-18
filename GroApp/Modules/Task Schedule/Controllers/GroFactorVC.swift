//
//  GroFactorVC.swift
//  GroApp
//
//  Created by Faisal Saleem on 29/09/2022.
//

import UIKit

class GroFactorVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
