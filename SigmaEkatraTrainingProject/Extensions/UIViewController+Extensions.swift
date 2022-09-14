//
//  UIViewController + Extensions.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 13/04/22.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}
