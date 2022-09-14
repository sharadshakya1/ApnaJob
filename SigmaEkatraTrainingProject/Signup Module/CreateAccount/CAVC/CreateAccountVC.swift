//
//  CreateAccountViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 10/04/22.
//

import UIKit

class CreateAccountVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var loginImage: UIImageView!
    @IBOutlet weak private(set) var loginTitle: UILabel!
    @IBOutlet weak private(set) var loginDescription: UILabel!
    @IBOutlet weak private(set) var submitButtonOutlet: UIButton!
    // MARK: - IBACtions
   @IBAction  private func submitActionButton(_ sender: Any) {
       let vc = CreateAccountFilledVC.instantiate(fromAppStoryboard: .main)
       self.navigationController?.pushViewController(vc, animated: true)    }
}
    // MARK: - LifeCycle Methods
extension CreateAccountVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        CommonProperties.commonProperties.buttonProperties(button: submitButtonOutlet)
        self.navigationController?.isNavigationBarHidden = true
    }
}
