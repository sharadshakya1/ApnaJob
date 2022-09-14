//
//  JobInterestedModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 01/07/22.
//


import Foundation
struct InterestedJob: Decodable {
    var statusCode : Int
    var success : Bool
    var data : [InterestedData]?
    var message : String
    var type : String
}

struct InterestedData : Codable {
    var location : InterestedLocation?
    var  _id : String?
    var jobName : String
    var salary : Int?
    var opening : Int?
    var companyName : String?
    var companyNameUrl : String?
    var jobAddedDays : Int?

}
struct InterestedLocation : Codable {
    var type : String?
    var coordinates : [Float]?
}
