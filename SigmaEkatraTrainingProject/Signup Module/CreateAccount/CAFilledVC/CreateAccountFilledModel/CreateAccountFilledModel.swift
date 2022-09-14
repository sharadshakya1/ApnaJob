//
//  CreateAccountFilledModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 27/06/22.
//

import Foundation
// MARK: - USER PROFILE CREATE PARAMETER AND RESPONSE
struct  CreateUserprofileParameter : Encodable {
    let username : String?
    let dateOfBirth : String?
    let emailAddress : String?
    let gender : Int?
    let locLat : Double?
    let locLong : Double?
    let disOfCurLocLat : Double?
    let disOfCurLocLong : Double?
    let disOfPerLocLong : Double?
    let disOfPerLocLat : Double?
    let userType : String?
}
struct ProfileResponse : Codable {
    var statusCode : Int
    var success : Bool
    var message : String
    var type : String
}
struct ExperienceParamter : Encodable {
    let education : Int?
    let isPreWorkExp : Bool?
    let typeOfPreWorkExp : [Int]?
   let previousSalary : [Int]?
   //let preferredLocation : Int?
//    let jobCategory : Int?
    let expectedSalary : Int?
    let workLookingFor :  [String]?
}
