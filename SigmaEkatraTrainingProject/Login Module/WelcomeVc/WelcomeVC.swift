//
//  WelcomeViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 05/04/22.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import GoogleSignIn
let config = GIDConfiguration.init(clientID: StringConstant.clientid.rawValue)

class WelcomeVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var continueGuestOutlet: UIButton!
    @IBOutlet weak private(set) var phoneLabel: UILabel!
    @IBOutlet weak private(set) var buttonFacebook: UIButton!
    @IBOutlet weak private(set) var appleLabel: UILabel!
    @IBOutlet weak private(set) var facebookLabel: UILabel!
    @IBOutlet weak private(set) var googleLabel: UILabel!
}
// MARK: - IBACtions
extension WelcomeVC {
    @IBAction  private func facebookAction(_ sender: Any) {
        FBManager.shared.facebookLogin(uiVC: self)
     }
    @IBAction  private func buttonGoogle(_ sender: Any) {
        GoogleManager.shared.googleLoginSetup(uiVC: self)
     }
    @IBAction  private func continueGuest(_ sender: Any) {
        let vc = LoginVC.instantiate(fromAppStoryboard: .main)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - Life Cycle Methods
extension WelcomeVC {
    override func viewDidLoad() {
      //  googleLogin()
        if let token = AccessToken.current,
           !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, last_name, picture, short_name, name, middle_name, name_format,age_range"], tokenString: token, version: nil, httpMethod: .get)
            request.start { (connection, result, error) in
               //  print("\(result)")
            }
        }
        continueGuestOutlet.setTitle(StringConstant.continueGuest.localized, for: .normal)
        phoneLabel.text = StringConstant.phoneLabelText.localized
        googleLabel.text = StringConstant.googleLabelText.localized
        facebookLabel.text = StringConstant.faceBookText.localized
        appleLabel.text = StringConstant.appleText.localized
        super.viewDidLoad()
        CommonProperties.commonProperties.labelProperties(label: appleLabel)
        CommonProperties.commonProperties.labelProperties(label: googleLabel)
        CommonProperties.commonProperties.labelProperties(label: facebookLabel)
        CommonProperties.commonProperties.labelProperties(label: phoneLabel)
        googleLabel.layer.borderColor = UIColor.black.cgColor
        googleLabel.layer.borderWidth = 1.0
    }
}
