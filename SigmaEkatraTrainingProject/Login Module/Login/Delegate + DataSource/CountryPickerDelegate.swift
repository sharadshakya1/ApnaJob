//
//  CountryPickerDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit
// MARK: - PickerView Delegate Methods

extension LoginVC : UIPickerViewDelegate ,UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.listCountryCode.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.listCountryCode[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.country = self.listCountryCode[row]
        self.countryCodeField.text = self.country
       
    }
}
