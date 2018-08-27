//
//  CoreDataManager.swift
//  RokoBitTest
//
//  Created by Olena Demkovska on 8/23/18.
//  Copyright © 2018 Olena Demkovska. All rights reserved.
//

import Foundation
import MagicalRecord

class CoreDataManager {
    
    //Saving data to storage
    class func saveUser(_ user: Profile) {
        MagicalRecord.save({ (context) in
            guard let profile = Profile.mr_createEntity(in: context) else { return }
            profile.avatar = user.avatar
            profile.firstName = user.firstName
            profile.lastName = user.lastName
            profile.id = user.id
        })
    }
    
    //Fetch data in storage
    class func getUser() -> Profile? {
        guard let profile = Profile.mr_findFirst() else { return nil }
        return profile
    }
    
    //Remove data in storage
    class func deteUser() {
        MagicalRecord.save({ (context) in
            guard let profile = Profile.mr_findFirst() else { return }
            profile.mr_deleteEntity(in: context)
        })
    }
}
