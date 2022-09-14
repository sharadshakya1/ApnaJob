//
//  JobDetailModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 23/06/22.
//

import Foundation
struct JobDetailResponse: Decodable {
    var statusCode : Int
    var success : Bool
    var data : Data5?
    var message : String
    var type : String
}

struct Data5 : Codable {
    var educationAndTiming : Education?
    var  personOfContact : Person?
    var  requirements : String?

}
struct Education : Codable {
    var education :String?
    var workingDays : String?
    var shiftTimings : String?
}
struct Person : Codable {
    var name : String
    var phoneNumber : String?
    var emailAddress : String?
    var preferredTimeForContacting : String?
}

