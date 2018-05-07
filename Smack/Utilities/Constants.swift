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

//Segues
let SHOW_LOGIN = "showLogin"
let SHOW_CREATE_ACCOUNT = "showCreateAccount"
let UNWIND_TO_CHANNEL = "unwindToChannel"

//User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


