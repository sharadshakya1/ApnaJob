//
//  HomeViewModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/06/22.
//

import Foundation

var getData = JobResponse(statusCode: 0, success: false, data: [Data2(location: Location(type: "", coordinates: [0.0]), _id: "", jobName: "", salary: 0, opening: 0, companyName: "", companyNameUrl: "", jobAddedDays: 0)], message: "", type: "")
var client = Project()

var interestedData = InterestedJob(statusCode: 0, success: false, data: [InterestedData(location: InterestedLocation(type: "", coordinates: [0.0]), _id: "", jobName: "", salary: 0, opening: 0, companyName: "", companyNameUrl: "", jobAddedDays: 0)], message: "", type: "")
