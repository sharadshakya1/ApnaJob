//
//  CreateAccountStep2ViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 11/04/22.
//

//import UIKit
//class CreateAccountStep2ViewController: UIViewController {
//    // MARK: - IBOUtlets
//    @IBOutlet weak private(set) var presentResidenceView: UIView!
//    @IBOutlet weak private(set) var permanentResidenceView: UIView!
//    @IBOutlet weak private(set) var submitOutlet: UIButton!
//    @IBOutlet weak private(set) var sv : UIStackView!
//    // MARK: - INTERNAL Properties
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        presentResidenceView.layer.masksToBounds = true
//        presentResidenceView.layer.cornerRadius = 10
//        presentResidenceView.layer.borderWidth = 1
//        presentResidenceView.layer.borderColor = UIColor.gray.cgColor
//        permanentResidenceView.layer.masksToBounds = true
//        permanentResidenceView.layer.cornerRadius = 10
//        permanentResidenceView.layer.borderWidth = 1
//        permanentResidenceView.layer.borderColor = UIColor.gray.cgColor
//        submitOutlet.layer.masksToBounds = true
//        submitOutlet.layer.cornerRadius = 10
//        submitOutlet.layer.borderWidth = 1
//        submitOutlet.layer.borderColor = UIColor.gray.cgColor
//    }
//    // MARK: - IBACtions
//   @IBAction  private func backAction(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
//    }
//   @IBAction  private func submitAction(_ sender: UIButton) {
//       guard let controller = storyboard?.instantiateViewController(identifier:"AddProfilePictureViewController") as? AddProfilePictureViewController else { return }
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .crossDissolve
//        // UserDefaults.standard.hasOnboarded = true
//        present(controller, animated: true, completion: nil)
//    }
//   @IBAction  private func permanentLocationAction(_ sender: UIButton) {
////        let controller = storyboard?.instantiateViewController(identifier:"MapLocationViewController") as! MapLocationViewController
////        controller.modalPresentationStyle = .fullScreen
////        controller.modalTransitionStyle = .crossDissolve
//        // UserDefaults.standard.hasOnboarded = true
//       // present(controller, animated: true, completion: nil)
//    }
//}
