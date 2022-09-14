//
//  OtpVerifyModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 27/06/22.
//

import Foundation
// MARK: - SIGNUP PARAMETER AND RESPONSE
struct Signup : Codable {
    var statusCode : Int?
    var success : Bool?
    var message : String?
    var type : String?
    var data : Data1?
}
 struct Data1 : Codable {
    let token : String?
}
struct SignupParameter : Encodable {
    let phoneNumber :String
    let code : String
}
