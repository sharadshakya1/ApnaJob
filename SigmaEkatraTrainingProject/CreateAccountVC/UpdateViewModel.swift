//
//  UpdateViewModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 24/06/22.
//

import Foundation
struct UpdateParamter : Encodable {
    let username : String
    let dateOfBirth : String
    let emailAddress : String
}

struct UpdateResponse :  Decodable {
    var statusCode : Int
    var success : Bool
    var data : UpdateDetail
    var message : String
    var type : String
}
struct UpdateDetail : Codable {
    
}
