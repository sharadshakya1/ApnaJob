//
//  LoginViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 05/04/22.
//

import UIKit
var flag = false

class LoginVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var loginFailed: UILabel!
    @IBOutlet weak private(set) var textField: UITextField!
    @IBOutlet weak private(set) var termsandConditionLabel: UILabel!
    @IBOutlet weak private(set) var flagView: UIView!
    @IBOutlet weak private(set) var submitOutlet: UIButton!
    @IBOutlet weak private(set) var countryCodeField: UITextField!
    var client = Project()
    var country : String?
    var listCountryCode = ["+91" ,"+92","+93","+94","+974","+963", "+283","+237","+233"]
    // MARK: - Date Picker
    func createAndSetupPicker() {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        self.countryCodeField.inputView = picker
    }
    func dismissAndClosePickerView() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let button = UIBarButtonItem(title: StringConstant.done.rawValue, style: .plain, target: self, action:#selector(self.dismissAction))
        toolbar.setItems([button], animated: true)
        toolbar.isUserInteractionEnabled = true
        self.countryCodeField.inputAccessoryView = toolbar
    }
    @objc func dismissAction() {
        self.view.endEditing(true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        dismissKeyboard()
    }
    func generateOtpApiCall() {
        if let countrycode = country {
            client.fetchGenerateOtp(phoneNumber: countrycode + textField.text!) { result in
            switch result {
            case .success(let signup):
                print("Your Otp is ...\(String(describing: signup))")
                guard  let controller = self.storyboard?.instantiateViewController(withIdentifier: StringConstant.otpController.rawValue) as? OtpVerifyVC else { return }
                flag = true
                controller.mobileno = self.textField.text!
                self.present(controller, animated: true, completion: nil)
              //  print("kgyj",self.country! + self.textField.text!)
            case .failure(let error):
                self.loginFailed.isHidden = false
                print("The error \(error)")
            }
        }
        }
    }
    // MARK: - TAP GESTURE IN TERMS AND CONDITION AND PRIVACY POLICY
   @IBAction  private func tapLabel(gesture: UITapGestureRecognizer) {
        let text = StringConstant.loginControllerText.rawValue
        let termsRange = (text as NSString).range(of: StringConstant.loginTermandCondition.rawValue)
        let privacyRange = (text as NSString).range(of: StringConstant.loginprivacy.rawValue)
        if gesture.didTapAttributedTextInLabel(label: termsandConditionLabel, inRange: termsRange) {
            if let controller = storyboard?.instantiateViewController(identifier: StringConstant.termsConditionController.rawValue) as? TermsAndConditionVC {
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true, completion: nil)
            }
        } else if gesture.didTapAttributedTextInLabel(label: termsandConditionLabel, inRange: privacyRange) {
            if let controller = storyboard?.instantiateViewController(identifier: StringConstant.privacyController.rawValue) as? PrivacyVC {
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true, completion: nil)
            }
        } else {
        }
    }
    // MARK: - IBActions for API CAll
   @IBAction  private func submit(_ sender: UIButton) {
        validationCode()
    generateOtpApiCall()
   }
    // MARK: - IBActions for back
   @IBAction  private func backButton(_ sender: Any) {
       self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - TAPGESTURE FOR NSATTRIBUTED STRING
extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        // MARK: - Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        // MARK: - Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
// MARK: - Extension for VALIDATION
extension LoginVC {
    fileprivate func validationCode() {
        if let phone = textField.text {
            if !phone.isValidPhone() {
                openAlert(title: StringConstant.alert.rawValue, message: StringConstant.phone.rawValue, alertStyle: .alert, actionTitles: [StringConstant.oky.rawValue], actionStyles: [.default], actions: [ { _ in
                    print("Okay clicked!")
                }])
            } else {
                // Navigation - Home Screen
            }
        } else {
            openAlert(title: StringConstant.alert.rawValue, message: StringConstant.addDetail.rawValue, alertStyle: .alert, actionTitles: [StringConstant.oky.rawValue], actionStyles: [.default], actions: [ { _ in
                print("Okay clicked!")
            }])
        }
    }
}
// MARK: - LifeCycle Methods
extension LoginVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        loginFailed.isHidden = true
        CommonProperties.commonProperties.buttonProperties(button: submitOutlet)
        CommonProperties.commonProperties.viewProperties(view: flagView)
        self.createAndSetupPicker()
        self.dismissAndClosePickerView()
        textField.keyboardType = .numberPad
        // MARK: - Terms and Conditions Properties
        let text = StringConstant.loginControllerText.rawValue
        termsandConditionLabel.text = text
        self.termsandConditionLabel.textColor =  UIColor.gray
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: StringConstant.loginTermandCondition.rawValue)
        let range2 = (text as NSString).range(of: StringConstant.loginprivacy.rawValue)
        underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 17), range: NSMakeRange(0, underlineAttriString.length))
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black , range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black , range: range2)
        termsandConditionLabel.attributedText = underlineAttriString
        termsandConditionLabel.isUserInteractionEnabled = true
        termsandConditionLabel.addGestureRecognizer(UITapGestureRecognizer(target:self , action: #selector(tapLabel(gesture:))))
    }
    override func viewWillAppear(_ animated: Bool) {
        print("########present#######________")
        navigationClosure = {
        let storyboard = UIStoryboard(name:StringConstant.main.rawValue, bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: StringConstant.sectionController.rawValue)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    }
}
