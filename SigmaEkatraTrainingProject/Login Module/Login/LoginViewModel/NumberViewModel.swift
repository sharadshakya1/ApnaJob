//
//  NumberViewModel.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 07/04/22.
//

import Foundation
class NumberViewModel {
private var login = CredentialPhone() {
        didSet {
            phoneNumber = login.phoneNumber
            otp = login.otp
        }
    }
    var credentialsInputErrorMessage : String = ""
    private var phoneNumber = ""
    private var otp = ""
    func updateCredentials(loginmobileno : String, loginOtp: String) {
        //
        login.phoneNumber = phoneNumber
        login.otp = otp
    }
   func isValidNumber(phone: String) -> Bool {
    let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
    let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
    return phoneTest.evaluate(with: phone)
}
    func isValidOtp(otp: String) -> Bool {
        let validotp = "1234"
        if (validotp == otp) {
            return true
        } else {
            return false
        }
    }
    func credentialsInput() -> CredentialsInputStatus {
        if phoneNumber.isEmpty {
            credentialsInputErrorMessage = "Please provide username and password."
            return .incorrect
        }
        if isValidNumber(phone: phoneNumber) && isValidOtp(otp: otp) {
        return .correct
        }
        return .incorrect
}
    
}

extension NumberViewModel {
    enum CredentialsInputStatus {
        case correct
        case incorrect
    }
}
