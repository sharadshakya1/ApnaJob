//
//  PhoneTextDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import UIKit
extension LoginVC : UITextViewDelegate {
// MARK: - TEXTFIELD DELEGATES
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let maxlength = 10
    let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
    if !text.isEmpty {
        submitOutlet.isUserInteractionEnabled = true
        submitOutlet.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
        // guard Range(range, in: ) != nil else { return false }
        let allowedCharacters = StringConstant.allowedNumber.rawValue
        let allowedCharcterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharcterSet = CharacterSet(charactersIn: string)
        // return allowedCharcterSet.isSuperset(of: typedCharcterSet)
        return  text.count <= maxlength && allowedCharcterSet.isSuperset(of: typedCharcterSet)
        // Enabling the button
    } else {
        submitOutlet.isUserInteractionEnabled = false
        submitOutlet.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 0.5)
        // Enabling the button
        // Disabling the button
    }
    return true
}
}
