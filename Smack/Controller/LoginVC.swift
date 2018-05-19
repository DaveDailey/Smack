//
//  LoginVC.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/7/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //btns
    @IBAction func createAcctBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: SHOW_CREATE_ACCOUNT, sender: nil)
    }
    @IBAction func exitLogin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let email = userNameTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        AuthService.instance.loginUser(email: email, password:password) {(success) in
                if success {
            AuthService.instance.findUserByEmail(completion: { (success) in
                if success {
                    self.spinner.stopAnimating()
                    self.spinner.isHidden = true
                    NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                    self.dismiss(animated: true, completion: nil)
                }
            })
            }
        }
    }
    
    
    //Text fields
    @IBOutlet weak var userNameTextField: TextFieldWithColor!
    @IBOutlet weak var passwordTextField: TextFieldWithColor!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

    }

    func setUpView() {
        spinner.isHidden = true
    }
    
}
