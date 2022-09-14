//
//  Observer.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 07/04/22.
//

import Foundation

struct LoginData {
    var name :  String
    var date :  String
    var email : String
}
struct CheckBoxData {
    var labeltext : Int?
}

var object = CheckBoxData()

struct GenderData {
    var genderSelect : Int?
}
 var genderObj = GenderData()
struct UserJob {
    var userSelect : String?
}
var userobj =  UserJob()

struct PreviousExp {
    var yesOrNo : Bool?
}

var expSelect = PreviousExp()

struct JobTitle {
    var title  : String?
    var jobIsApplied : Bool = false
    var jobIsInterested = false
}
var jobData : [JobTitle] = []

var jobApplied : [JobTitle] {
    data.filter({$0.jobIsApplied})
}
var jobInterested : [JobTitle] {
    data.filter({$0.jobIsInterested})
}
var data  : [JobTitle] = [JobTitle(title: "Executive - BPO") ,JobTitle(title: "BPO"),JobTitle(title: "Executive - Exp"),JobTitle(title: "Trainee"),JobTitle(title: "Architect"),JobTitle(title: "Software Engineer"),JobTitle(title: "TechLead")]
var data1  : [JobTitle] = [JobTitle(title : "")]
var appliedJob = [String]()

var dataJob  : [JobTitle] = [JobTitle(title: "")]
class Job {
    static var shared = Job()

}
enum PickerType {
    case  education
    case  job
    case  previousExp
    case preferLocation
}
let education = ["GRADUATE", "POSTGRADUATE", "DIPLOMA"]
let job = ["CONSTRUCTION_LABOR","CALL_CENTER_OPERATOR","FOOD_DELIVERY","OTHER"]
let previousExp = ["CONSTRUCTION_LABOR","CALL_CENTER_OPERATOR","FOOD_DELIVERY","OTHER"]
let preferLocate = ["NOIDA","CHANDIGARH","LUCKNOW","UTTARAKHAND"]
