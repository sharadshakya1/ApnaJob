//
//  JobAppliedModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 23/06/22.
//

import Foundation

struct JobAppliedResponse : Decodable {
    var statusCode : Int
    var success : Bool
    var data : [AppliedDetail]
    var message : String
    var type : String
}

struct AppliedDetail :  Codable {
    var appliedJobDetails : [Detail]
    enum CodingKeys : String, CodingKey {
        case appliedJobDetails = "AppliedJobDetails"
    }
}
struct Detail : Codable {
    var _id  : String
    var jobName : String
    var salary : Int
    var opening : Int
    var companyName : String
    var companyNameUrl : String
    var location : Location1?
}
struct Location1 : Codable {
    var type : String
    var coordinates : [Float]
}
var applieddata = JobAppliedResponse(statusCode: 0, success: false, data: [AppliedDetail(appliedJobDetails: [Detail(_id: "", jobName: "", salary: 0, opening: 0, companyName: "", companyNameUrl: "", location: Location1(type: "", coordinates: [0.0]))])], message: "", type: "")


