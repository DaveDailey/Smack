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
        guard let channelName = channelNameText.text, channelNameText.text != "" else {return}
        guard let description = descriptionText.text else {return}
        SocketService.instance.addChannel(channelName: channelName, channelDescription: description){ (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
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
