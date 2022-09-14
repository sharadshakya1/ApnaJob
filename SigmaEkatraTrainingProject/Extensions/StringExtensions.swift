//
//  Extensions.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 06/04/22.
//

import Foundation
import UIKit
extension String {
    func validateEmailId() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return applyPredicateOnRegex(regexStr: emailRegEx)
    }
    func isValidPhone() -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            return applyPredicateOnRegex(regexStr: phoneRegex)
        }
    func applyPredicateOnRegex(regexStr: String) -> Bool {
        let trimmedString = self.trimmingCharacters(in: .whitespaces)
        let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
        let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
        return isValidateOtherString
    }
}
