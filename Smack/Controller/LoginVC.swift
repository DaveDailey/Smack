//
//  LoginVC.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/7/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBAction func createAcctBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: SHOW_CREATE_ACCOUNT, sender: nil)
    }
    @IBAction func exitLogin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

   
    
}
