//
//  UserDataService.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/9/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import Foundation

class UserDataService{
    static let instance = UserDataService()
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData (id: String, color: String, avatarName:String, email: String, name: String){
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }

    func setAvatarName(name:String) {
        self.avatarName = name
    }
    //we need to turn a string into its component values and its not super simple
    func returnUIColor(components : String)->UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r,g,b,a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let red = r else {return defaultColor}
        guard let blue = b else {return defaultColor}
        guard let green = g else {return defaultColor}
        guard let alpha = a else {return defaultColor}
        
        let userColor = UIColor(red: CGFloat(red.doubleValue), green: CGFloat(green.doubleValue), blue: CGFloat(blue.doubleValue), alpha: CGFloat(alpha.doubleValue))
        
        return userColor
    }
    func logoutUser() {
        id = ""
        avatarColor = ""
        avatarName = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
    
    }
}
