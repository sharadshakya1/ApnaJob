//
//  FeedbackVC.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 02/05/22.
//

import UIKit

class FeedbackVC: UIViewController {
    @IBOutlet weak private(set) var ratingView : RatingController!
//    @IBOutlet weak private(set) var gtweg: RatingViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction private  func backAction(_ sender: Any) {
      dismiss(animated: true, completion: nil)
    }
    
    @IBAction private  func submitAction(_ sender: Any) {
        feedbackApiCall()
      //  print(rating)
        if let controller = storyboard?.instantiateViewController(identifier: StringConstant.tabController.rawValue) as? TabViewController {
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
    }

    }
    func feedbackApiCall() {
        client.feedback(rating:rating1, feedback:"this job is bad") { result in
              switch result {
              case .success(let feedback):
                  print("feedback data ...\(String(describing: feedback))")
              case .failure(let error):
                  print("The applied error \(error)")
              }
          }
    }
}
