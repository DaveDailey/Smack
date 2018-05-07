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
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
    }

   

}
