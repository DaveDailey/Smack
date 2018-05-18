//
//  Constants.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/7/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) ->()

//URL constants
let BASE_URL = "https://smackynew.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user//byEmail/"
let URL_CHANNEL_LOOKUP = "\(BASE_URL)/channel"
let URL_CREATE_CHANNEL = "\(BASE_URL)channel/add"

//Segues
let SHOW_LOGIN = "showLogin"
let SHOW_CREATE_ACCOUNT = "showCreateAccount"
let UNWIND_TO_CHANNEL = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//Headers
let HEADER = [
    "Content-Type": "application/json; charset= utf-8"
]

let BEARER_HEADER = [
    "Authorization": "Bearer \(AuthService.instance.authToken)",
    "Content-Type": "application/json; charset= utf-8"
]

//Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.262745098, green: 0.3411764706, blue: 0.7137254902, alpha: 0.5)

//Notification constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("noteifuserdidchange")
