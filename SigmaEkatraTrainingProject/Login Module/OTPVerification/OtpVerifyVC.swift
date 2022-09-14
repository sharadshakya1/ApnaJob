//
//  SheetViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 06/04/22.
//

import UIKit
var navigationClosure : (() -> Void)?
class OtpVerifyVC: UIViewController {
    lazy var numberViewobj = NumberViewModel()
    var clouser : (() -> Void)?
     // MARK: - IBOutlets
    @IBOutlet weak private(set) var submitOutlet: UIButton!
    @IBOutlet weak private(set) var textfield1: UITextField!
    @IBOutlet weak private(set) var textfield2: UITextField!
    @IBOutlet weak private(set) var textfield3: UITextField!
    @IBOutlet weak private(set) var textfield4: UITextField!
    @IBOutlet weak private(set) var timerLabel: UILabel!
    var client = Project()
    var signup = Signup()
    var finalString = ""
    var seconds = 30
    var minutes =  00
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    var textFieldArray: [UITextField] {
        return [textfield1!, textfield2!, textfield3!, textfield4!]
    }
    var otp : String?

    func getConsolidatedString() -> String {
        for textField in textFieldArray {
            finalString += textField.text ?? ""
        }
        return finalString
    }
    @objc func changeCharacter(textField : UITextField) {
        if textField.text?.utf8.count == 1 {
            switch textField {
            case textfield1:
                textfield2.becomeFirstResponder()
            case textfield2:
                textfield3.becomeFirstResponder()
            case textfield3:
                textfield4.becomeFirstResponder()
            case textfield4:
                print("\(textfield1.text!)\(textfield2.text!)\(textfield3.text!)\(textfield4.text!)")
                otp = "\(textfield1.text!)\(textfield2.text!)\(textfield3.text!)\(textfield4.text!)"
            default:
                break
            }
        } else if textField.text!.isEmpty {
            switch textField {
            case textfield4:
                textfield3.becomeFirstResponder()
            case textfield3:
                textfield2.becomeFirstResponder()
            case textfield2:
                textfield1.becomeFirstResponder()
            default:
                break
            }
        }
    }
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(OtpVerifyVC.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            // Send alert to indicate time's up.
        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
            if seconds < 10 {
                timerLabel.text = String("00:0\(seconds)")
            } else {
               timerLabel.text = String("00:\(seconds)")
            }
        }
    }
    func timeString(time:TimeInterval) -> String {
        let seconds = Int(time) % 60
        return String(format:"%02i", seconds)
    }
    func otpVerifyApiCall() {
        client.fetchSignup(phoneNumber: "91" + mobileno, code: otp!) { result in
            switch result {
            case .success(let login):
                print("-----\(String(describing:login))")
                let token = login?.data?.token
                keychainAccess["token"] = token
                navigationClosure!()
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
    var mobileno : String =  ""
}
// MARK: - IBActions
extension OtpVerifyVC {
    @IBAction  private func submitButton(_ sender: Any) {
        otpVerifyApiCall()
        dismiss(animated: true, completion: nil)
         numberViewobj.updateCredentials(loginmobileno: mobileno, loginOtp:finalString)
         switch numberViewobj.credentialsInput() {
         case .correct:
             print("correct")
         case .incorrect:
             print("cannot login")
         }
    }
    @IBAction  private func resetButtonTapped(_ sender: UIButton) {
         timer.invalidate()
         seconds = 30
         timerLabel.text = timeString(time: TimeInterval(seconds))
         timerLabel.text = String("00:\(seconds)")
         runTimer()
         isTimerRunning = false
     }
 }

// MARK: - LifeCycle Methods
extension OtpVerifyVC {
    override func viewDidLoad() {
        print(finalString)
        CommonProperties.commonProperties.buttonProperties(button: submitOutlet)
        print(finalString)
        if flag {
            runTimer()
        }
        textfield1.delegate = self
        textfield2.delegate = self
        textfield3.delegate = self
        textfield4.delegate = self
        self.textfield1.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.textfield2.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.textfield3.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
        self.textfield4.addTarget(self, action: #selector(self.changeCharacter), for: .editingChanged)
    }

}
