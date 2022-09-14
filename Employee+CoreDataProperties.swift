//
//  Employee+CoreDataProperties.swift
//  
//
//  Created by Sharad Shakya on 13/04/22.
//
//

import Foundation
import CoreData
extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: String?
    @NSManaged public var email: String?
    @NSManaged public var location: String?

}
