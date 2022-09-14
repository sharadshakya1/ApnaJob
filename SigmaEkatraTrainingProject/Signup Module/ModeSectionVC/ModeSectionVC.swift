//
//  ModeSectionViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 08/04/22.
//

import UIKit
var userType : String = ""
class ModeSectionVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var view1: UIView!
    @IBOutlet weak private(set) var view3: UIView!
    @IBOutlet weak private(set) var radioButton3: UIButton!
    @IBOutlet weak private(set) var radioButton2: UIButton!
    @IBOutlet weak private(set) var radioButton1: UIButton!
    @IBOutlet weak private(set) var nextbut: UIButton!
    @IBOutlet weak private(set) var view2: UIView!
    @IBOutlet weak private(set) var headingLabel: UILabel!
    @IBOutlet weak private(set) var imageView: UIImageView!
}
// MARK: - IBActions
extension ModeSectionVC {
    @IBAction  private func nextButton(_ sender: Any) {
        let vc = CreateAccountVC.instantiate(fromAppStoryboard: .main)
        self.navigationController?.pushViewController(vc, animated: true)
     }
    @IBAction  private func radioAction1(_ sender: Any) {
        nextbut.isUserInteractionEnabled = true
         if radioButton1.isSelected {
             radioButton1.isSelected = false
             radioButton2.isSelected = false
             radioButton3.isSelected = false
         } else {
             radioButton1.isSelected = true
             userobj.userSelect = "1"
             radioButton2.isSelected = false
             radioButton3.isSelected = false
         }
     }
    @IBAction  private func radioAction2(_ sender: Any) {
        nextbut.isUserInteractionEnabled = false

         if radioButton2.isSelected {
             radioButton1.isSelected = false
             radioButton2.isSelected = false
             radioButton3.isSelected = false
         } else {
             userobj.userSelect = "2"
             radioButton2.isSelected = true
             radioButton1.isSelected = false
             radioButton3.isSelected = false
         }
     }
    @IBAction  private func radioAction3(_ sender: Any) {
        nextbut.isUserInteractionEnabled = false

         if radioButton3.isSelected {
             radioButton1.isSelected = false
             radioButton2.isSelected = false
             radioButton3.isSelected = false
         } else {
             userobj.userSelect = "3"
             radioButton3.isSelected = true
             radioButton1.isSelected = false
             radioButton2.isSelected = false
         }
     }
}
// MARK: - LIFE Cycle Methods
extension ModeSectionVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        CommonProperties.commonProperties.viewProperties(view: view1)
        CommonProperties.commonProperties.viewProperties(view: view2)
        CommonProperties.commonProperties.viewProperties(view: view3)
        CommonProperties.commonProperties.buttonProperties(button: nextbut)
        imageView.image = #imageLiteral(resourceName: "chooseModeSectionLogo")
    }
}
