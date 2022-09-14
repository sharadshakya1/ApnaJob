//
//  ExampleClient.swift
//  PostCodableRequest
//  Created by Sharad Shakya on 24/04/22.

import Foundation
import UIKit
import KeychainAccess
// MARK: - Import KeyChain
let keychainAccess = Keychain(service: "Appinventiv.SigmaEkatraTrainingProject")
typealias Parameters = [String: String]

class Project: GenericAPIClient {
    var token : String?
    var deviceId : String?
    internal let session: URLSession
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    convenience init() {
        self.init(configuration: .default)
    }
    // MARK: - GENERATEOTP REQUEST
    func fetchGenerateOtp(phoneNumber: String, completion: @escaping (Result<GenerateOtp?, APIError>) -> Void ) {
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        let parameter = GenerateOtpParameter(phoneNumber:phoneNumber)
        guard let request = ProjectFeed.generateOtp.postRequest(parameters: parameter,
                                                                     headers: [HTTPHeader.contentType("application/json")]) else { return }
        fetch(with: request , decode: { json -> GenerateOtp? in
            guard let results = json as? GenerateOtp else { return  nil }
            print(".....",results)
            return results
        }, completion: completion)
    }
    // MARK: - SIGNUP REQUEST
    func fetchSignup(phoneNumber: String,code:String, completion: @escaping (Result<Signup?, APIError>) -> Void) {
        let parameter = SignupParameter(phoneNumber:phoneNumber , code: code )
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.signup.postRequest(parameters: parameter,
                                                           headers: [HTTPHeader.contentType("application/json")
                                                                     ,HTTPHeader.accept("/")
                                                                     , HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                    ]) else {return}
        fetch(with: request , decode: { json -> Signup? in
            guard let results = json as? Signup else { return  nil }
            self.token = results.data?.token
            return results
  }, completion: completion)
}
    // MARK: - Create Request
    func create(username: String ,dateofBirth :String ,emailAddress: String ,gender : Int  ,lat : Double,long : Double ,disLat :Double , disLong : Double  , permaLong : Double , permaLat : Double,usertype :String ,completion: @escaping (Result<ProfileResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"]
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        let parameter = CreateUserprofileParameter(username: username,dateOfBirth: dateofBirth , emailAddress: emailAddress , gender: genderObj.genderSelect , locLat: lat , locLong: long ,disOfCurLocLat: disLat , disOfCurLocLong: disLong , disOfPerLocLong: permaLong , disOfPerLocLat: permaLat, userType: usertype)
        guard let request = ProjectFeed.profileCreate.putRequest(parameters: parameter,
                                                                   headers:[HTTPHeader.contentType("application/json"),HTTPHeader.accept("/"),HTTPHeader.authorization("\(authorToken ?? "")"),HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }
        fetch(with: request , decode: { json -> ProfileResponse? in
            guard let results = json as? ProfileResponse else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: - Image Upload Post Request
    func image(name: String,id :String ,completion: @escaping (Result<ProfileResponse?, APIError>) -> Void) {
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        let authorToken = keychainAccess["token"]
        let parameters = ["name": "MyImage",
                          "id": "7888"]
        let boundary = generateBoundary()
        guard let mediaImage = Media(withImage: profileImage ?? UIImage(), forKey: "profile_pic") else { return }
        let dataBody = createDataBody(withParameters: parameters, media: [mediaImage], boundary: boundary)
        guard var  request = ProjectFeed.imageUpload.putRequest(parameters: dataBody,
                                                                   headers:[
                                                                             HTTPHeader.contentType("multipart/form-data; boundary=\(boundary)")
                                                                            ,HTTPHeader.accept("/")
                                                                            ,HTTPHeader.authorization("\(authorToken ?? "")")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }
        request.httpBody = dataBody
        fetch(with: request , decode: { json -> ProfileResponse? in
            guard let results = json as? ProfileResponse else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: - Work Experience Request
    func workExp(education : Int ,expBool : Bool,typeWorkExperience :Int ,  previousSalary :Int,expectedSalary : Int ,  interestedJob : [String] , completion: @escaping (Result<ProfileResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"]
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        let parameter =  ExperienceParamter(education: education, isPreWorkExp: expBool,typeOfPreWorkExp: [typeWorkExperience], previousSalary: [previousSalary], expectedSalary: expectedSalary , workLookingFor: interestedJob)
        guard let request = ProjectFeed.experienceDetail.postRequest(parameters: parameter,
                                                                   headers:[HTTPHeader.contentType("application/json"),HTTPHeader.accept("/"),HTTPHeader.authorization("\(authorToken ?? "")"),HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }
        fetch(with: request , decode: { json -> ProfileResponse? in
            guard let results = json as? ProfileResponse else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: - Get Job Request
    func job(completion: @escaping (Result<JobResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        let parameter = ""
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.job.getRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> JobResponse? in
            guard let results = json as? JobResponse else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: - Apply Filter Request
    func filter(jobName: String   , completion: @escaping (Result<JobResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"]
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        let parameter = FilterParameter(jobName: jobName)
        guard let request = ProjectFeed.filter.postRequest(parameters: parameter,
                                                                   headers:[
                                                                    HTTPHeader.contentType("application/json")
                                                                   ,HTTPHeader.accept("/")
                                                                   ,HTTPHeader.authorization("\(authorToken ?? "")"),
                                                                    HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }
        fetch(with: request , decode: { json -> JobResponse? in
            guard let results = json as? JobResponse else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: - Job Detail Request
    func jobDetail(completion: @escaping (Result<JobDetailResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        id = UserDefaults.standard.object(forKey: "jobid") as? String ?? ""

        let parameter = ""
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.jobDetail.getRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> JobDetailResponse? in
            guard let results = json as? JobDetailResponse else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: Job Apply Request
    func jobApply(completion: @escaping (Result<JobApplyResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        id = UserDefaults.standard.object(forKey: "jobid") as? String ?? ""

        let parameter = ""
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.jobApply.getRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> JobApplyResponse? in
            guard let results = json as? JobApplyResponse else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: - JOB Applied Request
    func jobApplied(completion: @escaping (Result<JobAppliedResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        id = UserDefaults.standard.object(forKey: "jobid") as? String ?? ""

        let parameter = ""
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.jobApplied.getRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> JobAppliedResponse? in
            guard let results = json as? JobAppliedResponse else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: - Get User Details
    func userDetails(completion: @escaping (Result<ProfileModel?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        id = UserDefaults.standard.object(forKey: "jobid") as? String ?? ""

        let parameter = ""
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.userDetails.getRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> ProfileModel? in
            guard let results = json as? ProfileModel else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: - Patch Update Details
    func updateDetails(username : String , date : String , email : String,completion: @escaping (Result<UpdateResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        let parameter = UpdateParamter(username: username, dateOfBirth: date, emailAddress: email)
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.updatedetails.patchRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.contentType("application/json")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> UpdateResponse? in
            guard let results = json as? UpdateResponse else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: - Get Test Question
    func testQuestion(completion: @escaping (Result<TestQuestionModel?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        id = UserDefaults.standard.object(forKey: "jobid") as? String ?? ""

        let parameter = ""
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.testQuestion.getRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> TestQuestionModel? in
            guard let results = json as? TestQuestionModel else { return  nil }
            return results
        }, completion: completion)
    }
    // MARK: - Logout Api Request
    func logOut(completion: @escaping (Result<UpdateResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        id = UserDefaults.standard.object(forKey: "jobid") as? String ?? ""

        let parameter = ""
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        let status = "LogOut Successfully"
        UserDefaults.standard.set(status, forKey: "status")
        guard let request = ProjectFeed.logOut.postRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> UpdateResponse? in
            guard let results = json as? UpdateResponse else { return  nil }
            return results
        }, completion: completion)
    }
    func feedback(rating : Int , feedback :  String ,completion: @escaping (Result<UpdateResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        id = UserDefaults.standard.object(forKey: "jobid") as? String ?? ""

        let parameter = FeedbackParemeter(rating: rating, feedback: feedback)
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.feedback.postRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.contentType("application/json")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> UpdateResponse? in
            guard let results = json as? UpdateResponse else { return  nil }
            return results
        }, completion: completion)
    }
    func submitAnswer(questionId : String , userAnswer :  String ,completion: @escaping (Result<UpdateResponse?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        let parameter = SubmitAnswerParamter(questionId: questionId, userAnswer: userAnswer)
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.submitAnswer.postRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.contentType("application/json")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> UpdateResponse? in
            guard let results = json as? UpdateResponse else { return  nil }
            return results
        }, completion: completion)
    }
    func answerCount(completion: @escaping (Result<AnswerCount?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        id = UserDefaults.standard.object(forKey: "jobid") as? String ?? ""

        let parameter = ""
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.answerCount.getRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> AnswerCount? in
            guard let results = json as? AnswerCount else { return  nil }
            return results
        }, completion: completion)
    }
    func interestedJob(completion: @escaping (Result<InterestedJob?, APIError>) -> Void) {
        let authorToken = keychainAccess["token"] ?? ""
        id = UserDefaults.standard.object(forKey: "jobid") as? String ?? ""

        let parameter = ""
        deviceId =  UIDevice.current.identifierForVendor!.uuidString
        guard let request = ProjectFeed.interested.getRequest(parameters: parameter,
                                                                   headers: [
                                                                             HTTPHeader.accept("/")
                                                                            ,HTTPHeader.authorization("\(authorToken)")
                                                                            ,HTTPHeader.deviceid("\(deviceId ?? "")")
                                                                             ]
                                                                ) else { return }

        fetch(with: request , decode: { json -> InterestedJob? in
            guard let results = json as? InterestedJob else { return  nil }
            return results
        }, completion: completion)
    }
}
// ENDPOINT CONFORMANCE
enum ProjectFeed {
    case generateOtp
    case signup
    case profileCreate
    case imageUpload
    case experienceDetail
    case job
    case filter
    case jobDetail
    case jobApply
    case jobApplied
    case userDetails
    case updatedetails
    case testQuestion
    case logOut
    case feedback
    case submitAnswer
    case answerCount
    case interested
}

extension ProjectFeed: Endpoint {
    var base: String {
        return "http://44.202.78.173:5008"
    }
    var path: String {
        switch self {
        case .generateOtp: return "/user/generateOtp"
        case .signup: return "/user/Login"
        case .profileCreate : return "/user/profileCreate"
        case .imageUpload :  return "/user/profilePicUpload"
        case .experienceDetail : return "/user/createWorkExperienceDetails"
        case .job : return  "/get/jobs"
        case .filter : return "/filter/jobs"
        case .jobDetail : return "/job/details/"  + "\(jobid)"
        case .jobApply : return  "/job/apply/" + "\(jobid)"
        case .jobApplied : return "/appliedjobs"
        case .userDetails : return "/user/details"
        case .updatedetails : return "/user/updatedetails"
        case .testQuestion : return "/get/questions/62ab2cc3baca150b70b29e85"
        case .logOut :  return  "/user/logout"
        case .feedback :  return  "/submit/jobfeedback/62ab2cc3baca150b70b29e85"
        case .submitAnswer :  return "/submit/answer/62ab2cc3baca150b70b29e85"
        case .answerCount : return  "/answercount/62ab2cc3baca150b70b29e85"
        case .interested :  return  "/intrestedjobs"
        }
    }
}
func generateBoundary() -> String {
   return "Boundary-\(NSUUID().uuidString)"
}
func createDataBody(withParameters params: Parameters?, media: [Media]?, boundary: String) -> Data {
    let lineBreak = "\r\n"
    var body = Data()
    if let parameters = params {
        for (key, value) in parameters {
            body.append("--\(boundary + lineBreak)")
            body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
            body.append("\(value + lineBreak)")
        }
    }
    if let media = media {
        for photo in media {
            body.append("--\(boundary + lineBreak)")
            body.append("Content-Disposition: form-data; name=\"\(photo.key)\"; filename=\"\(photo.file)\"\(lineBreak)")
            body.append("Content-Type: \(photo.mimeType + lineBreak + lineBreak)")
            body.append(photo.data)
            body.append(lineBreak)
        }
    }
    body.append("--\(boundary)--\(lineBreak)")
    return body
}
extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

struct Media {
    let key: String
    let file: String
    let data: Data
    let mimeType: String
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        self.mimeType = "image/jpeg"
        self.file = "imagefile.jpg"
        guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
        self.data = data
    }
}
