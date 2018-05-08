//
//  CreateAcctVC.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/7/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import UIKit

class CreateAcctVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var userEmailTxt: UITextField!
    @IBOutlet weak var userPasswordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
    }
    @IBAction func pickAvatarPressed(_ sender: Any) {
    }
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = userEmailTxt.text , userEmailTxt.text != "" else {return}
        guard let pass = userPasswordTxt.text , userPasswordTxt.text != "" else {return}
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password:pass, completion: {(success) in
                    if success {
                        print("logged in user!", AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    
    
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
