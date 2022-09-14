//
//  HomeModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/06/22.
//

import Foundation
struct JobResponse: Decodable {
    var statusCode : Int
    var success : Bool
    var data : [Data2]?
    var message : String
    var type : String
}

struct Data2 : Codable {
    var location : Location?
    var  _id : String?
    var jobName : String
    var salary : Int?
    var opening : Int?
    var companyName : String?
    var companyNameUrl : String?
    var jobAddedDays : Int?

}
struct Location : Codable {
    var type : String?
    var coordinates : [Float]?
}
