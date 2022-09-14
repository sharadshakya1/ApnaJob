//
//  CAPickerViewDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit
var edu : Int?
var prevExp : Int?
var preferLocation1 : Int?
var jobSelect : Int?
extension CraeteAccountWorkExpCollectionViewCell : UIPickerViewDelegate ,UIPickerViewDataSource , UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == piker1 {
                return education.count
            } else if pickerView == piker2 {
                 return previousExp.count
            } else if pickerView == piker3 {
                        return preferLocate.count
            }  else if pickerView == piker4 {
                    return job.count
            }
            return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == piker1 {
                return education[row]

            } else if pickerView == piker2 {
                 return previousExp[row]
            } else if pickerView == piker3 {
             return preferLocate[row]
            }  else if pickerView == piker4 {
                    return job[row]
                }
            return ""
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == piker1 {
               categoryTextField.text = education[row]
               edu = row + 1
           } else if pickerView == piker2 {
               previousExpTextField.text = previousExp[row]
               //refreshClosure?()
               prevExp = (row + 1)
           } else if pickerView == piker4 {
               jobField.text = job[row]
              // refreshClosure?()
               jobSelect = row + 1
           } else {
               preferLocation.text = preferLocate[row]
              // refreshClosure?()
              preferLocation1 = row + 1
        }
// refreshClosure?()
       }
    }
