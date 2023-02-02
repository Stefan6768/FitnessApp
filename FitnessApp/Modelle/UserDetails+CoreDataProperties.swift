//
//  UserDetails+CoreDataProperties.swift
//  
//
//  Created by Stefan Schreiber on 31.01.23.
//
//

import Foundation
import CoreData


extension UserDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserDetails> {
        return NSFetchRequest<UserDetails>(entityName: "UserDetails")
    }

    @NSManaged public var alterdetail: String?
    @NSManaged public var geschlechtdetail: String?
    @NSManaged public var gewichtdetail: Int64
    @NSManaged public var groessedetail: Int64
    @NSManaged public var user: User?

}
