//
//  JSONParser.swift
//  RokoBitTest
//
//  Created by Olena Demkovska on 8/23/18.
//  Copyright © 2018 Olena Demkovska. All rights reserved.
//

import Foundation
import Alamofire

class JsonParser {
    
    static let shared = JsonParser()
    
    func parseJSON(json: NSDictionary) -> Profile? {
        let user = Profile.mr_createEntity()! as Profile
        if let data = json["data"] as? NSDictionary {
            user.id = data["id"] as? String ?? ""
            user.firstName = data["first_name"] as? String ?? ""
            user.lastName = data["last_name"] as? String ?? ""
            user.avatar = data["avatar"] as? String ?? ""
        }
        return user
    }
}
