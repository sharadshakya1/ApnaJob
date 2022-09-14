//
//  CreateAccountStep1CollectionViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 27/04/22.
//

import UIKit

var locationClosure : (() -> String)?

class CreateAccountStep1CollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var emailAddressError: UILabel!
    @IBOutlet weak private(set) var dateOfBirthError: UILabel!
    @IBOutlet weak private(set) var nameError: UILabel!
    @IBOutlet weak private(set) var dateOfBirth: UIView!
    @IBOutlet weak private(set) var nameField: UITextField!
    @IBOutlet weak private(set) var maleView: UIView!
    @IBOutlet weak private(set) var dateField: UITextField!
    @IBOutlet weak private(set) var emailText: UITextField!
    @IBOutlet weak private(set) var locationOutlet: UIButton!
    @IBOutlet weak private(set) var currentLocationLabel: UILabel!
    @IBOutlet weak private(set) var locationoOutlet: UIButton!
    @IBOutlet weak private(set) var otherButtonOutlet: UIButton!
    @IBOutlet weak private(set) var femaleButtonOutlet: UIButton!
    @IBOutlet weak private(set) var maleButtonOutlet: UIButton!
    @IBOutlet weak private(set) var otherView: UIView!
    @IBOutlet weak private(set) var femaleView: UIView!
    @IBOutlet weak private(set) var locationView: UIView!
    @IBOutlet weak private(set) var femaleLabel: UILabel!
    @IBOutlet weak private(set) var maleLabel: UILabel!
    @IBOutlet weak private(set) var otherLabel: UILabel!
    @IBOutlet weak private(set) var dateIcon: UIImageView!
}
// MARK: - Internal Functions
 extension CreateAccountStep1CollectionViewCell {
     func createpicker() {
         let datapicker = UIDatePicker()
         datapicker.datePickerMode = .date
         dateField.inputView = datapicker
         let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 345, height: 44))
         let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelclick))
         let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneclick))
         let flexible  = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
         toolbar.setItems([cancel , flexible ,done], animated: false)
         dateField.inputAccessoryView = toolbar
         datapicker.preferredDatePickerStyle  = .wheels
     }
     func textFieldDidBeginEditing(_ textView: UITextField) {
         self.createpicker()
         dateIcon.image = UIImage(named: "blackDateIcon")
     }
     @objc func cancelclick() {
         dateField.resignFirstResponder()
     }
     @IBAction private func emailChanged(_ sender: Any) {
//         if let email = emailText.text {
//             if let errorMessage = invalidEmail(email) {
//                 emailAddressError.text = errorMessage
//                 emailAddressError.isHidden = false
//             } else {
//                 emailAddressError.isHidden = true
//             }
//         }
//         checkForValidForm()
     }
     
     @IBAction private func dateChanged(_sender : Any)
    {
//         if let  date = dateField.text {
//             if let errorMessage = isValidDate(date)
//             {
//                 dateOfBirthError.text = errorMessage
//                 dateIcon.isHidden =  false
//             }
//             else  {
//                 dateOfBirthError.isHidden = true
//             }
//         }
     }
//     func isValidDate(_ dateString: String) -> String {
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "MM/dd/yyyy"
//        if let _ = dateFormatterGet.date(from: dateString) {
//            //date parsing succeeded, if you need to do additional logic, replace _ with some variable name i.e date
//            return "Valid"
//        } else {
//            // Invalid date
//            return "Invalid Date"
//        }
//    }
     @objc func doneclick() {
        //  print("::",dateField.text)
         if (dateField.inputView as? UIDatePicker) != nil {
             let dateformat = DateFormatter()
             dateformat.dateStyle = .medium
             dateField.textColor = .lightGray
             dateformat.dateFormat = "MM/dd/YYYY"
             let outputFormatter = DateFormatter()
             outputFormatter.dateFormat = "dd/MM/YYYY"
             //let date = dateformat.date(from: "\(dateformat)")
             let showDate = dateformat.date(from: "07/21/2016")
             //dateformat.dateFormat = "dd/MM/yyyy"
             let resultString = outputFormatter.string(from: showDate!)
             print(resultString)
             /*
              let inputFormatter = NSDateFormatter()
              inputFormatter.dateFormat = "MM/dd/YYYY"

              let outputFormatter = NSDateFormatter()
              outputFormatter.dateFormat = "YYYY-MM-dd"

              let showDate = inputFormatter.dateFromString("07/21/2016")
              let resultString = outputFormatter.stringFromDate(showDate!)

              print(resultString)
              */
          dateField.text = resultString

             dateIcon.image = UIImage(named: "blackDateIcon")
         }
         dateField.resignFirstResponder()
     }
//     func checkForValidForm() {
//         if emailAddressError.isHidden {
//             buttonEnabledClosure?()
//         } else {
//            buttonDisabledClosure?()
//         }
//     }
//     func invalidEmail(_ value: String) -> String? {
//         let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//         let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
//         if !predicate.evaluate(with: value) {
//             return "Invalid Email Address"
//         }
//         return nil
//     }
//     func resetForm() {
//         buttonDisabledClosure?()
//         emailAddressError.isHidden = true
//         nameError.isHidden = true
//         dateOfBirthError.isHidden = true
//         nameError.text = "required"
//         dateOfBirthError.text = "required"
//         emailAddressError.text = "required"
//         nameField.text = ""
//         dateField.text = ""
//         emailText.text = ""
//     }

 }

// MARK: - IBActions
extension CreateAccountStep1CollectionViewCell {
    @IBAction  private func genderSelection(_ sender: UIButton) {
        sender.isSelected.toggle()
         switch sender.tag {
         case 1001 :
             print("Male")
             genderObj.genderSelect = 1
             femaleButtonOutlet.isSelected = false
             otherButtonOutlet.isSelected = false
             femaleView.backgroundColor = .white
             otherView.backgroundColor = .white
             maleView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
         case 1002 :
             print("Female")
             genderObj.genderSelect = 2
             maleButtonOutlet.isSelected = false
             maleView.backgroundColor = .white
             otherView.backgroundColor = .white
             otherButtonOutlet.isSelected = false
             femaleView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
         case 1003 :
             print("Other")
             genderObj.genderSelect = 3
             maleButtonOutlet.isSelected = false
             femaleButtonOutlet.isSelected = false
             maleView.backgroundColor = .white
             femaleView.backgroundColor = .white
             otherView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
         default :
             print("No button")
         }
     }
    @IBAction private func locationAction(_ sender: Any) {
    }
}

// MARK: - LIFE cycle Methods
extension CreateAccountStep1CollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // resetForm()
        nameField.delegate = self
        dateField.delegate = self
        nameField.textColor = UIColor.black
        nameField.font = UIFont.boldSystemFont(ofSize: 14)
        dateField.layer.borderColor =  UIColor.lightGray.cgColor
        dateIcon.image = UIImage(named: "cakeLogo")
        registered = Registration(name: nameField.text, dateOfBirth: dateField.text, emailId: emailText.text, gender: genderObj.genderSelect, lat: lat, longi: longi)
        CommonProperties.commonProperties.viewProperties(view: dateOfBirth)
        CommonProperties.commonProperties.viewProperties(view: maleView)
        CommonProperties.commonProperties.viewProperties(view: femaleView)
        CommonProperties.commonProperties.viewProperties(view: otherView)
        CommonProperties.commonProperties.viewProperties(view: locationView)
//        print(register)
    }
}
