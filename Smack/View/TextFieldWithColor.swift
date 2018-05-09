//
//  TextFieldWithColor.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/9/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import UIKit

@IBDesignable
class TextFieldWithColor: UITextField {
        
        override func awakeFromNib() {
            self.setupView()
        }
        
        override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
            self.setupView()
        }
        
        func setupView(){
            guard let placeholder = self.placeholder else {return}
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        }
    
   
}
