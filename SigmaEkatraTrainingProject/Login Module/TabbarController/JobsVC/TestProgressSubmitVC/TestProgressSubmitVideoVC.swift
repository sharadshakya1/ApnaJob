//
//  TestProgressVCViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 02/05/22.
//

import UIKit

class TestProgressSubmitVideoVc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    func setup() {
        let titleimageView = UIImageView(image: #imageLiteral(resourceName: "ekatraTitleLogo"))
        titleimageView.frame = CGRect(x: 0, y: 0, width:132 , height: 28)
        titleimageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleimageView
        // print("123")
        let backButton = UIButton(type: .custom)
        backButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        if let image = UIImage(named: "backLogo.png") {
            backButton.setImage(image, for: .normal)
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
}
