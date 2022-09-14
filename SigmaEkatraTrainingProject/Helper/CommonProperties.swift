//
//  CommonProperties.swift
//  
//
//  Created by Sharad Shakya on 01/05/22.
//

import Foundation
import UIKit

class CommonProperties {
    static let commonProperties = CommonProperties()

func buttonProperties(button : UIButton) {
    button.layer.cornerRadius = 10
   // button.layer.masksToBounds = true
}

func viewProperties(view :UIView) {
    view.layer.masksToBounds = true
    view.layer.cornerRadius = 10
    view.layer.borderColor = UIColor.lightGray.cgColor
    view.layer.borderWidth = 1
}
    func labelProperties(label :UILabel) {
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
    }
}
