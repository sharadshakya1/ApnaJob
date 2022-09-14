//
//  JobApplyModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 23/06/22.
//

import Foundation
struct JobApplyResponse : Decodable {
    var statusCode : Int
    var success : Bool
    var data : Data6
    var message : String
    var type : String
}
struct Data6 : Codable {
}


