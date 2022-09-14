//
//  FBManager.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 19/06/22.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

struct FBManager {
    static var shared = FBManager()
    func facebookLogin(uiVC : UIViewController) {
       let fbLoginManager:LoginManager = LoginManager()
       fbLoginManager.logIn(permissions: [StringConstant.email.rawValue], from: uiVC) { result, error in
    if error == nil {
        let fbloginresult : LoginManagerLoginResult = result!
        if fbloginresult.grantedPermissions.contains(StringConstant.email.rawValue) {
            getFBUserData()
        }
    }
}
func getFBUserData() {
            if AccessToken.current != nil {
                GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, last_name, picture, short_name, name, middle_name, name_format,age_range"]).start { connection, result, error in
                    if let result = result {
                        print(result)
                    }
                }
            }
        }
}
}
