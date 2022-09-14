//
//  TestQuestionModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 24/06/22.
//

import Foundation

struct  TestQuestionModel : Codable {
    var statusCode : Int?
    var success : Bool?
    var data :  [TestData]?
    var message : String?
    var type : String?
}
struct TestData :  Codable {
    var _id  : String?
    var jobName : String?
    var location :  JobLocation?
    var  questions : [QuestionsNo]?
    enum CodingKeys : String, CodingKey {
        case questions = "Questions"
    }
}
struct  JobLocation :Codable {
    var type : String?
    var coordinates  : [Double]?
}
struct QuestionsNo : Codable {
    var _id : String?
    var question : String?
    var answers : [String]?
}

struct SubmitAnswerParamter : Encodable {
    let questionId :  String
    let userAnswer :  String
}

struct AnswerCount : Decodable {
    var statusCode :  Int
    var success :  Bool
    var data : AnswerData
    var message : String
    var type : String
}

struct AnswerData : Codable {
    var answerGivenByUser : [AnswerFound]
    var totalQuestion : [TotalQuestion]
}
struct AnswerFound : Codable {
    var _id : String
    var totalAnswers : Int
}
struct TotalQuestion :  Codable {
    var _id : String
    var totalQuestions :  Int
}
