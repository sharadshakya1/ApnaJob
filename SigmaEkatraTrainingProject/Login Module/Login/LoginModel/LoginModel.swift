//
//  LoginModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 26/06/22.
//

import Foundation
// MARK: - GENERATE OTP PARAMETER AND RESPONSE
struct GenerateOtp: Codable {
    var statusCode : Int
    var success : Bool
    var message : String
    var type : String
}

struct GenerateOtpParameter: Encodable {
    let phoneNumber: String
}
