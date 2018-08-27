//
//  NeyworkManager.swift
//  RokoBitTest
//
//  Created by Olena Demkovska on 8/23/18.
//  Copyright © 2018 Olena Demkovska. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static var shared = NetworkManager()
   
    
    func loginUser(login: String, password: String, completion: @escaping (_ user: Profile?,_ error: Error?) -> ()) {
        guard let url = createUrl(login: login, password: password) else { return completion(nil, NSError()) }
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.httpBody, headers: nil).responseJSON { response in
            switch response.result {
            case .success(let JSON):
                print(JSON)
                completion(JsonParser.shared.parseJSON(json: JSON as! NSDictionary), nil)
            case .failure:
                completion(nil, response.result.error! as Error)
                debugPrint("<<<<<<<<Error>>>>>>\(response.result.error!)")
            }
            
        }
    }
    
    //MARK: URL
    private func createUrl(login: String, password: String) -> URL? {
        let url = URL(string: "https://reqres.in/api/users/2")
        return url
    }
}
