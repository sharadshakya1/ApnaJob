//
//  GoogleManager.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 19/06/22.
//

import Foundation
import GoogleSignIn

struct GoogleManager {
    static var shared = GoogleManager()
    func googleLoginSetup(uiVC : UIViewController){
    GIDSignIn.sharedInstance.signIn(with: config, presenting: uiVC) { user, error in
        guard error == nil else {return}
        print("de",user!)
    }
    func googleLogin() {
        if GoogleSignIn.GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GoogleSignIn.GIDSignIn.sharedInstance.restorePreviousSignIn()
            print("Already Login")
        }
    }

}
}
