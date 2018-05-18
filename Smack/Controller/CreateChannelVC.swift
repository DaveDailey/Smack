//
//  CreateChannelVC.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/18/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import UIKit

class CreateChannelVC: UIViewController {
    
    //Text Fields
    @IBOutlet weak var channelNameText: TextFieldWithColor!
    @IBOutlet weak var descriptionText: TextFieldWithColor!
    @IBOutlet weak var bgView: UIView!
    
    //Btns
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelBtn(_ sender: Any) {
        let channel = channelNameText.text ?? ""
        let description = descriptionText.text ?? ""
        MessageService.instance.addChannel(name:channel, description:description ,completion:{ (success) in if success {
            
            }
        })
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()

    }
    
    func setUpView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(CreateChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }

    

}
