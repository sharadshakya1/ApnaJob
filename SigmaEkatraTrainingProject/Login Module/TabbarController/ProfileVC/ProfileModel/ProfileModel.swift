//
//  ProfileModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 24/06/22.
//

import Foundation

struct ProfileModel: Decodable {
    var statusCode : Int
    var success : Bool
    var data : [ProfileData]?
    var message : String
    var type : String
}
struct ProfileData : Decodable {
    var _id : String
    var phoneNumber : Int
    var location :  LocationUser?
    var  disOfCurLoc : CurrentLocation
    var  disOfPerLoc : PermanentLocation
    var username : String
    var dateOfBirth : String
    var emailAddress : String
    var gender : Int
    var profileUrl : String
    var educationAndWorkDetails  : [Details]?
    enum CodingKeys : String, CodingKey {
        case educationAndWorkDetails = "EducationAndWorkDetails"
        case username = "username"
        case _id = "_id"
        case phoneNumber = "phoneNumber"
        case emailAddress = "emailAddress"
        case dateOfBirth = "dateOfBirth"
        case gender = "gender"
        case profileUrl = "profileUrl"
        case location = "location"
        case disOfCurLoc = "disOfCurLoc"
        case disOfPerLoc = "disOfPerLoc"

    }
}
struct LocationUser : Codable {
    var type : String
    var coordinates : [Float?]
}
struct CurrentLocation : Codable {
    var type : String
    var coordinates : [Float?]
}
struct PermanentLocation : Codable {
    var type : String
    var coordinates : [Float?]
}
struct Details : Codable {
    var _id : String?
    var education :  Int?
    var isPreWorkExp : Bool?
    var typeOfPreWorkExp : [Int]?
    var previousSalary : [Int]?
}
