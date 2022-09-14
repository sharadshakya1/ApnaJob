//
//  TermsAndConditionViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 06/04/22.
//

import UIKit

class TermsAndConditionVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // MARK: - IBOutlets
   @IBAction  private func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
