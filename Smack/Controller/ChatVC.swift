//
//  ChatVC.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/6/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var menuBtn: UIButton!
    

    override func viewDidLoad() {
        MessageService.instance.lookUpChannels { (success) in
        
        }
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
    
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in if success {
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                }
            }
        )}
    }

  
    

    

}
