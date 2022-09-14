//
//  Create_Account_WorkViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 15/04/22.
//

//import UIKit
//
//class CreateAccountWorkVC: UIViewController {
//    @IBOutlet weak  private(set) var previousExpTextField: UITextField!
//    @IBOutlet weak private(set) var secondView: UIView!
//    @IBOutlet weak private(set) var noButtonOutlet: UIButton!
//    @IBOutlet weak private(set) var yesButtonOutlet: UIButton!
//    @IBOutlet weak private(set) var firstView: UIView!
//    @IBOutlet weak private(set) var yesLabelView: UIView!
//    @IBOutlet weak private(set) var noLabelView: UIView!
//    @IBOutlet weak private(set) var yesLabel: UILabel!
//    @IBOutlet weak private(set) var noLabel: UILabel!
//    @IBOutlet weak private(set) var noImageView: UIView!
//    @IBOutlet weak private(set) var yesImageView: UIView!
//    @IBOutlet weak private(set) var imageView1: UIImageView!
//    @IBOutlet weak private(set) var imageView2: UIImageView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        yesLabelView.layer.masksToBounds = true
//        yesLabelView.layer.cornerRadius = 10
//        yesLabelView.layer.borderWidth = 1
//        yesLabelView.layer.borderColor = UIColor.lightGray.cgColor
//        noLabelView.layer.masksToBounds = true
//        noLabelView.layer.cornerRadius = 10
//        noLabelView.layer.borderWidth = 1
//        noLabelView.layer.borderColor = UIColor.lightGray.cgColor
//        yesImageView.layer.masksToBounds = true
//        imageView1.contentMode = .center
//        imageView2.contentMode = .center
//
//        yesImageView.layer.cornerRadius = (yesImageView.frame.size.height)/2
//        yesImageView.layer.borderColor = UIColor.lightGray.cgColor
//        yesImageView.layer.borderWidth = 1.0
//        noImageView.layer.cornerRadius = (noImageView.frame.size.height)/2
//        noImageView.layer.borderColor = UIColor.lightGray.cgColor
//        noImageView.layer.borderWidth = 1.0
//        firstView.isHidden = true
//        secondView.isHidden = true
//        // Do any additional setup after loading the view.
//    }
//   @IBAction  private func buttonAction(_ sender: UIButton) {
//       sender.isSelected.toggle()
//        switch sender.tag {
//        case 1001 :
//            print("Yes")
//            secondView.isHidden = false
//            firstView.isHidden = true
//            noButtonOutlet.isSelected = false
//            noLabelView.backgroundColor = .white
//            yesLabelView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
//        case 1002 :
//            print("No")
//            firstView.isHidden = false
//            secondView.isHidden = true
//            yesButtonOutlet.isSelected = false
//            yesLabelView.backgroundColor = .white
//            noLabelView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
//        default :
//            print("No button")
//        }
//    }
//    @IBAction private func presentButton(_ sender: UIButton) {
//        if let controller = storyboard?.instantiateViewController(identifier:"CreateAccountWorkExpVC") as?  CreateAccountWorkExpVC {
//         controller.modalPresentationStyle = .fullScreen
//         controller.modalTransitionStyle = .crossDissolve
//         controller.delegate = self
//         present(controller, animated: true, completion: nil)
//        }
//     }
//    }
//
//extension CreateAccountWorkVC : JobPass {
//    func jobpass(job: String) {
//       // print(location)
//        print(job)
//        previousExpTextField.text = job
//    }
//}
