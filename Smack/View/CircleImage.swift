//
//  CircleImage.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/9/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import UIKit

@IBDesignable

class CircleImage: UIImageView {
   
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
}
