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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var userEmailTxt: UITextField!
    @IBOutlet weak var userPasswordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    //variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5,0.5,0.5,1]"
    var bgColor : UIColor?
    
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255))/255
        let g = CGFloat(arc4random_uniform(255))/255
        let b = CGFloat(arc4random_uniform(255))/255
        let a :CGFloat = 1
        bgColor = UIColor(red: r, green: g, blue: b, alpha: a)
        UIView.animate(withDuration: 0.2) {
        self.userImg.backgroundColor = self.bgColor
        }
       
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let name = usernameTxt.text , usernameTxt.text != "" else {return}
        guard let email = userEmailTxt.text , userEmailTxt.text != "" else {return}
        guard let pass = userPasswordTxt.text , userPasswordTxt.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password:pass, completion: {(success) in if success {
                            AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in if success {
                                self.performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
                                self.spinner.stopAnimating()
                                self.spinner.isHidden = true
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
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
        spinner.isHidden = true
        let tap = UIGestureRecognizer(target: self, action: #selector(CreateAcctVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
        if avatarName.contains("light") && bgColor == nil {
            userImg.backgroundColor = UIColor.lightGray
        } else if avatarName.contains("dark") {
            userImg.backgroundColor = UIColor.gray
        }
    }
    
    
    
    @objc func handleTap () {
        view.endEditing(true)
    }
}
