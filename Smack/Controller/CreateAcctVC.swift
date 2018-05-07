//
//  CreateAcctVC.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/7/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import UIKit

class CreateAcctVC: UIViewController {

    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND_TO_CHANNEL, sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
