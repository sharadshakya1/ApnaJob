//
//  ChangeLanguageVC.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 03/05/22.
//

import UIKit
var languageClosure : (() -> Void)?
class ChangeLanguageVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var englishSectionView: UIView!
    @IBOutlet weak private(set) var hindiSectionView: UIView!
    @IBOutlet weak private(set) var englishButtion: UIButton!
    @IBOutlet weak private(set) var hindiButton: UIButton!
    @IBOutlet weak private(set) var updateButton: UIButton!
    // MARK: - IBACtions
    @IBAction private func backAction(_ sender: UIButton) {
        languageClosure!()
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction private func englishLanguageButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            hindiButton.isSelected = false
            UserDefaults.standard.set(1, forKey: "language")
            UserDefaults.standard.synchronize()
        }

    }
    @IBAction private func hindiLanguageButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if sender.isSelected {
            englishButtion.isSelected = false
            UserDefaults.standard.set(0, forKey: "language")
            UserDefaults.standard.synchronize()
            
        }
    }
}
extension ChangeLanguageVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        CommonProperties.commonProperties.viewProperties(view: englishSectionView)
        CommonProperties.commonProperties.viewProperties(view: hindiSectionView)
        updateButton.clipsToBounds = true
       // CommonProperties.commonProperties.buttonProperties(button:updateButton)
    }

}
// extension String {
//    func localiseString(loc:String) -> String
//    {
//        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
//        let bundle = Bundle(path: path!)
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
//    }
// }
