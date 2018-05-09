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
        performSegue(withIdentifier: SHOW_LOGIN, sender: nil)
    }
    
    //Outlets
    @IBOutlet weak var profileIcon: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
    }

    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            loginBtn.titleLabel?.text = UserDataService.instance.name
            profileIcon.image = UIImage(named: UserDataService.instance.avatarName)
            profileIcon.backgroundColor = UIColor(named: UserDataService.instance.avatarColor)
        }
        loginBtn.sizeToFit()
    }
   

}
