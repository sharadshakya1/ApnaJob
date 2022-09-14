//
//  TestQuestionViewModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 24/06/22.
//

import Foundation
var testQuestionData = TestQuestionModel(statusCode: 0, success: false, data: [TestData(_id: "", jobName: "", location: JobLocation(type: "", coordinates: [0.0]), questions: [QuestionsNo(_id: "", question: "", answers: [""])])], message: "", type: "")
var answerCountData = AnswerCount(statusCode: 0, success: false, data: AnswerData(answerGivenByUser: [AnswerFound(_id: "", totalAnswers: 0)], totalQuestion: [TotalQuestion(_id: "", totalQuestions: 0)]), message: "", type: "")
