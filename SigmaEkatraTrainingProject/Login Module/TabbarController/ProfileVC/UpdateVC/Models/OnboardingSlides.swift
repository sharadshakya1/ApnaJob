//
//  OnboardingSlides.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 05/04/22.
//

import Foundation
import UIKit

struct OnboardingSlides {
    let title: String
    var description : String
    let image  : UIImage
}

struct CredentialPhone {
    var phoneNumber : String  = ""
    var otp : String = ""
}
struct NewCountryJson : Codable {
      var code : String
      var name : String
}
 var countryData = [NewCountryJson]()

struct  Question {
    let  title : String
//    let  desc : String
//    let question1 : String
//    let question2 : String
//    let question3 : String
//    let question4 : String
}

struct Registration {
    let name : String?
    let dateOfBirth : String?
    let emailId : String?
    let gender : Int?
    let lat : Double?
    let longi : Double?
}
var registered : Registration?
struct SearchName {
    let searchname : String
}

struct Setting {
    let iconImage : UIImage
    let title : String?
}
var profileImage  : UIImage?
