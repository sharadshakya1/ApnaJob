//
//  File.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 08/04/22.
//

import Foundation
enum StringConstant : String {
    case  slidestitle  = "slidestitle"
    case  slidesdescription = "slidesdescription"
    case  skipButton = "skipButton"
    case getStarted = "getStarted"
    case phoneLabelText = "phoneLabelText"
    case googleLabelText = "googleLabelText"
    case faceBookText = "faceBookText"
    case appleText = "appleText"
    case findyourdreamjob = "findyourdreamjob"
    case collectioncell = "OnboardingCollectionViewCell"
    case welcomeController = "WelcomeVC"
    case loginController = "LoginVC"
    case  loginControllerText = "By signing up you agree to EKATRA Terms & Condition and Privacy Policy"
    case loginTermandCondition  = "Terms & Condition"
    case loginprivacy = "Privacy Policy"
    case termsConditionController = "TermsAndConditionVC"
    case otpController = "OtpViewController"
    case privacyController = "PrivacyVC"
    case pageController = "PageViewController"
    case sectionController = "ModeSectionViewController"
    case createAccountController = "CreateAccountViewController"
    case createAccount1Controller = "CreateAccount1ViewController"
    case createAccountStep1CollectionViewCell = "CreateAccountStep1CollectionViewCell"
    case createAccountStep2CollectionViewCell = "CreateAccountStep2CollectionViewCell"
    case createAddProfilePictureCollectionViewCell = "CreateAddProfilePictureCollectionViewCell"
    case craeteAccountWorkExpCollectionViewCell = "CraeteAccountWorkExpCollectionViewCell"
    case createAccountWorkExpStep4CollectionViewCell = "CreateAccountWorkExpStep4CollectionViewCell"
    case createAccountAddVideoCollectionViewCell = "CreateAccountAddVideoCollectionViewCell"
    case createAccountAddLocationCollectionViewCell = "CreateAccountAddLocationCollectionViewCell"
    case createAccountFilledVC = "CreateAccountFilledVC"
    case createAccountWorkVC = "CreateAccountWorkVC"
    case testController = "TestQuestionVC"
    case cancel =  "Cancel"
    case done = "Done"
    case clientid = "654469710549-21d0e95d3qrgt67dv2j1pokum0esrb9o.apps.googleusercontent.com"
    case email = "email"
    case alert  = "Alert"
    case phone = "Phone Number not found."
    case oky = "Okay"
    case addDetail = "Please add detail."
    case allowedNumber = "+1234567890"
    case homeTableViewCell = "HomeTableViewCell"
    case allJobs = "All Jobs"
    case interestJobs = "Interested Jobs"
    case appliedJobs = "Applied Jobs"
    case homeController = "HomeViewController"
    case homeStep2TableViewCell = "HomeStep2TableViewCell"
    case jobDetailViewController = "JobDetailViewController"
    case tabController = "TabViewController"
    case main = "Main"
    case homeCollectionViewCell = "HomeCollectionViewCell"
    case executiveBpo = "Executive-BPO"
    case constructionLabour = "Construction-Labor"
    case callCenterOperator = "Call-Center-Operator"
    case foodDelivery = "Food-Delivery"
    case  android = "Andriod"
    case ios = "IOS"
    case flutter = "Flutter"
    case reactNative = "hello nkaran kayaabdbudu"
    case nodeJs =  "NodeJs"
    case profileViewController = "ProfileViewController"
    case profileTableViewCell = "ProfileTableViewCell"
    case educationTableViewCell = "EducationTableViewCell"
    case testPassTableViewCell = "TestPassTableViewCell"
    case documentsTableViewCell = "DocumentsTableViewCell"
    case changeLanguageVC = "ChangeLanguageVC"
    case aboutVC = "AboutVC"
    case fAQVC  = "FAQVC"
    case settingTableViewCell = "SettingTableViewCell"
    case filterPresentVC = "FilterPresentVC"
    case filterTableViewCell = "FilterTableViewCell"
    case hindi  = "Hindi"
    case english = "English"
    case ekatraTest = "ekatraTest"
    case continueGuest = "continueGuest"
    case continueFeedBack = "FeedbackVC"
    case ekatraLogo = "ekatraLogo"
    case updateVC = "UpdateVC"
}
extension StringConstant {
    var localized : String {
        let language = UserDefaults.standard.value(forKey: "language")
        guard let selectedLang = AppLanguage(rawValue: (language as? Int) ?? 0 ) else { return self.rawValue.localiseString(loc: "en") }
        switch selectedLang {
        case .english:
            return self.rawValue.localiseString(loc: "en")
        case .hindi:
            return self.rawValue.localiseString(loc: "hi")
        }
    }
}
enum AppLanguage: Int {
    case hindi = 0
    case english = 1
    var text: String? {
        switch self {
        case .english: return StringConstant.english.localized
        case .hindi: return StringConstant.hindi.localized
        }
    }
}
extension String {
    func localiseString(loc:String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
