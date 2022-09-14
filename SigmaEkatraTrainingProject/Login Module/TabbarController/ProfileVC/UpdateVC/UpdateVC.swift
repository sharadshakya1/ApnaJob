//
//  UpdateVC.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 24/06/22.
//

import UIKit

class UpdateVC: UIViewController {

    @IBOutlet weak private(set) var nameLabel: UITextField!
    @IBOutlet weak private(set) var dateBirth: UITextField!
    @IBOutlet weak private(set) var emailAddress: UITextField!
    @IBOutlet weak private(set) var coordinatesLocation: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction private func updateButton(_ sender: UIButton) {
        if let name = nameLabel.text , let date = dateBirth.text , let email = emailAddress.text {
        client.updateDetails(username:name , date: date, email:email ) { result in
              switch result {
              case .success(let jobApplied):
                  print("job applied dta  is ...\(String(describing: jobApplied))")
                  reloadClosure?()
              case .failure(let error):
                  print("The applied error \(error)")
              }
          }
        }
    }
    @IBAction private func backAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
