//
//  DataBaseFile.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 13/04/22.
//

import Foundation
import CoreData
import UIKit

class DataBaseFile {
    static var sharedInstance = DataBaseFile()
    private init() {}
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    func save(object:[String:String]) {
        let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context!)
        employee.setValue(object["name"], forKey: "name")
        employee.setValue(object["date"], forKey: "date")
        employee.setValue(object["email"], forKey: "email")
        employee.setValue(object["location"], forKey: "location")
//        employee.name = object["name"]
//        employee.date = object["date"]
//        employee.email = object["email"]
//        employee.location = object["location"]
        do {
            try context?.save()
            print("Saved")
        } catch {
            print("data not saved")
        }
    }
    func fetchData(entityName: TableName) {
        print("Fetching Data..")
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName.rawValue)
                request.returnsObjectsAsFaults = false
                do {
                    let result = try context?.fetch(request)
                    guard let results = result as? [NSManagedObject] else { return}
                    for data in results {
                       print(data)
                    }
                } catch {
                    print("Fetching data Failed")
                }
    }
}

/*
 let context = persistentContainer.viewContext
      
      // old way
      // let employee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee // NSManagedObject
      
      // new way
      let employee = Employee(context: context)

      employee.name = name

      do {
          try context.save()
          return employee
      } catch let error {
          print("Failed to create: \(error)")
      }

      return nil
 */

enum TableName : String {
    case employee = "Employee"
    case manager = "Manager"
}
