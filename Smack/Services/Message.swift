//
//  Message.swift
//  Smack
//
//  Created by DAVID DAILEY on 5/11/18.
//  Copyright © 2018 davedailey. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class MessageService {
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func addChannel (name: String, description: String, completion:@escaping CompletionHandler) {
        let body: [String:Any] = [
            "name":name,
            "description":description
        ]
        
        Alamofire.request(URL_CREATE_CHANNEL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON {
            (response) in
            if response.result.error == nil {
                
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func lookUpChannels (completion: @escaping CompletionHandler) {
        Alamofire.request(URL_CHANNEL_LOOKUP, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON {
            (response) in
            if response.result.error == nil {
                
                //result is an array in json format. So we loop through each array item, pull out the important parts and finally turn them into a new channel. Storeing all our channels in our master array. this will be important for my apps
                
                guard let data = response.data else {return}
                if let json = JSON(data:data).array {
                    for item in json {
                        let id = item["_id"].stringValue
                        let description = item["description"].stringValue
                        let channelTitle = item["name"].stringValue
                        let channel = Channel(id: id, description: description, channelTitle: channelTitle)
                        self.channels.append(channel)
                        completion(true)
                    }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
}
