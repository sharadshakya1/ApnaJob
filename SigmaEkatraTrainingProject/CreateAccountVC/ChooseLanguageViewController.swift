//
//  ChooseLanguageViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 26/04/22.
//

import UIKit

class ChooseLanguageViewController: UIViewController {
    @IBOutlet weak  private(set) var englishView: UIView!
    @IBOutlet weak private(set) var hindiView: UIView!
    @IBOutlet weak private(set) var radioOutlet1: UIButton!
    @IBOutlet weak private(set) var radioOutlet2: UIButton!
    @IBOutlet weak private(set) var nextOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        englishView.layer.masksToBounds = true
        englishView.layer.cornerRadius = 10
        englishView.layer.borderColor = UIColor.gray.cgColor
        englishView.layer.borderWidth = 1
        hindiView.layer.masksToBounds = true
        hindiView.layer.cornerRadius = 10
        hindiView.layer.borderColor = UIColor.gray.cgColor
        hindiView.layer.borderWidth = 1
        nextOutlet.layer.masksToBounds = true
        nextOutlet.layer.cornerRadius = 10
        nextOutlet.isUserInteractionEnabled = false
    }
    @IBAction private func radioButton1(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            radioOutlet2.isSelected = false
            UserDefaults.standard.set(1, forKey: "language")
            UserDefaults.standard.synchronize()
            nextOutlet.isUserInteractionEnabled = true
        }
    }
    @IBAction private func radioButton2(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            radioOutlet1.isSelected = false
            UserDefaults.standard.set(0, forKey: "language")
            UserDefaults.standard.synchronize()
            nextOutlet.isUserInteractionEnabled = true
        }
    }
    @IBAction private func nextAction(_ sender: UIButton) {
        let vc = TutorialScreenVC.instantiate(fromAppStoryboard: .main)
        self.navigationController?.pushViewController(vc, animated: true)

//         controller.modalPresentationStyle = .fullScreen
//         controller.modalTransitionStyle = .crossDissolve
//         present(controller, animated: true, completion: nil)
    }
}
