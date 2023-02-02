//
//  User+CoreDataProperties.swift
//  
//
//  Created by Stefan Schreiber on 31.01.23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var alter: String?
    @NSManaged public var geschlecht: String?
    @NSManaged public var gewicht: Int64
    @NSManaged public var groesse: Int64
    @NSManaged public var userdetails: UserDetails?

}
