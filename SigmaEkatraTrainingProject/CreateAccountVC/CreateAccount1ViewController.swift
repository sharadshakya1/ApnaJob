//
//  CreateAccount1ViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 10/04/22.
//

import UIKit

class CreateAccount1ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var backOutlet: UIButton!
    @IBOutlet weak private(set) var dateOfBirth: UIView!
    @IBOutlet weak private(set) var nameField: UITextField!
    @IBOutlet weak private(set) var maleView: UIView!
    @IBOutlet weak private(set) var dateField: UITextField!
    @IBOutlet weak private(set) var emailText: UITextField!
    @IBOutlet weak private(set) var currentLocationLabel: UILabel!
    @IBOutlet weak private(set) var locationoOutlet: UIButton!
    @IBOutlet weak private(set) var otherButtonOutlet: UIButton!
    @IBOutlet weak private(set) var femaleButtonOutlet: UIButton!
    @IBOutlet weak private(set) var maleButtonOutlet: UIButton!
    @IBOutlet weak private(set) var otherView: UIView!
    @IBOutlet weak private(set) var femaleView: UIView!
    @IBOutlet weak private(set) var submitOutlet: UIButton!
    @IBOutlet weak private(set) var locationView: UIView!
    // MARK: - Internal Properties
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        dateField.delegate = self
        dateOfBirth.layer.masksToBounds = true
        dateOfBirth.layer.cornerRadius = 4
        dateOfBirth.layer.borderColor = UIColor.lightGray.cgColor
        dateOfBirth.layer.borderWidth = 1
        submitOutlet.layer.masksToBounds = true
        submitOutlet.layer.cornerRadius = 10
        submitOutlet.layer.borderColor = UIColor.gray.cgColor
        submitOutlet.layer.borderWidth = 1
        maleView.layer.masksToBounds = true
        maleView.layer.cornerRadius = 10
        maleView.layer.borderColor = UIColor.lightGray.cgColor
        maleView.layer.borderWidth = 1
        femaleView.layer.masksToBounds = true
        femaleView.layer.cornerRadius = 10
        femaleView.layer.borderColor = UIColor.lightGray.cgColor
        femaleView.layer.borderWidth = 1
        otherView.layer.masksToBounds = true
        otherView.layer.cornerRadius = 10
        otherView.layer.borderColor = UIColor.lightGray.cgColor
        otherView.layer.borderWidth = 1
        locationView.layer.masksToBounds = true
        locationView.layer.cornerRadius = 10
        locationView.layer.borderColor = UIColor.gray.cgColor
        locationView.layer.borderWidth = 1
        DataBaseFile.sharedInstance.fetchData(entityName: .employee)
    }
    override func viewWillAppear(_ animated: Bool) {
        DataBaseFile.sharedInstance.fetchData(entityName: .employee)
    }
    // MARK: - IBAction
//   @IBAction  private func submitAction(_ sender: Any) {
//        let dict = ["name" : nameField.text, "date": dateField.text, "email": emailText.text ,"location": currentLocationLabel.text]
//       guard let dict1 =  dict as? [String:String] else {return}
//        DataBaseFile.sharedInstance.save(object: dict1)
//        validationCode()
//       if let controller = storyboard?.instantiateViewController(identifier:"CreateAccountStep2ViewController") as? CreateAccountStep2ViewController {
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .crossDissolve
//        present(controller, animated: true, completion: nil)
//       }
//    }
   @IBAction  private func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   @IBAction  private func genderSelection(_ sender: UIButton) {
       sender.isSelected.toggle()
        switch sender.tag {
        case 1001 :
            print("Male")
            femaleButtonOutlet.isSelected = false
            otherButtonOutlet.isSelected = false
            femaleView.backgroundColor = .white
            otherView.backgroundColor = .white
            maleView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
        case 1002 :
            print("Female")
            maleButtonOutlet.isSelected = false
            maleView.backgroundColor = .white
            otherView.backgroundColor = .white
            otherButtonOutlet.isSelected = false
            femaleView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
        case 1003 :
            print("Other")
            maleButtonOutlet.isSelected = false
            femaleButtonOutlet.isSelected = false
            maleView.backgroundColor = .white
            femaleView.backgroundColor = .white
            otherView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
        default :
            print("No button")
        }
    }
   @IBAction  private func locationButton(_ sender: Any) {
       if let controller = storyboard?.instantiateViewController(identifier:"CreateAccountLocationViewController") as?  CreateAccountLocationViewController {
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        // controller.delegate = self
        present(controller, animated: true, completion: nil)
       }
    }
}
// MARK: - Calling Protocol
// extension CreateAccount1ViewController : LocationPass {
//    func locationpass(location: String) {
//        print(location)
//        currentLocationLabel.text = location
//    }
// }
extension CreateAccount1ViewController {
    func createpicker() {
        let datapicker = UIDatePicker()
        datapicker.datePickerMode = .date
        dateField.inputView = datapicker
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelclick))
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneclick))
        let flexible  = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancel , flexible ,done], animated: false)
        dateField.inputAccessoryView = toolbar
        datapicker.preferredDatePickerStyle  = .wheels
    }
    @objc func cancelclick() {
        dateField.resignFirstResponder()
    }
    @objc func doneclick() {
        if let datepicker = dateField.inputView as? UIDatePicker {
            let dateformat = DateFormatter()
            dateformat.dateStyle = .medium
            dateField.textColor = .lightGray
            dateField.text = dateformat.string(from: datepicker
                                                .date
            )
        }
        dateField.resignFirstResponder()
    }

}
// MARK: - TextField Delegate Methods
extension CreateAccount1ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textView: UITextField) {
        self.createpicker()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
    }
}

extension CreateAccount1ViewController {
    fileprivate func validationCode() {
        if let email = emailText.text {
            if !email.validateEmailId() {
                openAlert(title: "Alert", message: "Email address not found.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [ { _ in
                    print("Okay clicked!")
                }])
            } else {
                // Navigation - Home Screen
            }
        } else {
            openAlert(title: "Alert", message: "Please add detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [ { _ in
                print("Okay clicked!")
            }])
        }
    }
}
