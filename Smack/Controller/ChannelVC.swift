//
//  ChannelVC.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/6/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn == false {
        performSegue(withIdentifier: SHOW_LOGIN, sender: nil)
        } else if AuthService.instance.isLoggedIn == true {
        let profile = ProfileVC()
        profile.modalPresentationStyle = .custom
        present(profile, animated: true, completion: nil)
        }
    }
    
    //Outlets
    @IBOutlet weak var profileIcon: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
       
        loginBtn.sizeToFit()
    }
   
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn == true {
            loginBtn.titleLabel?.text = UserDataService.instance.name
            profileIcon.image = UIImage(named: UserDataService.instance.avatarName)
            profileIcon.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            profileIcon.image = UIImage(named: "menuProfileIcon")
            profileIcon.backgroundColor = UIColor.clear
        }
    }
}
