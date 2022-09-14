//
//  TestProgressVC.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 09/05/22.
//

import UIKit

class TestProgressVC1: UIViewController {

    @IBOutlet weak private(set) var outerView: UIView!
    @IBOutlet weak private(set) var videoOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       // outerView.layer.cornerRadius = (videoOutlet.frame.size.height)/2
//        outerView.layer.borderColor = UIColor.white.cgColor
//        outerView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
//        outerView.layer.borderWidth = 2.0
//        outerView.layer.masksToBounds = true
        outerView.layer.borderWidth = 2
        outerView.layer.borderColor = UIColor.white.cgColor
    }
}
