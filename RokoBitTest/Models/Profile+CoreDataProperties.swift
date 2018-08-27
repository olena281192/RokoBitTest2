//
//  Profile+CoreDataProperties.swift
//  
//  Created by Olena Demkovska on 8/23/18.
//  Copyright © 2018 Olena Demkovska. All rights reserved.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var avatar: String?
    @NSManaged public var id: String?

}
