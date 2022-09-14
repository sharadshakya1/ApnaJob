//
//  TestQuestionPopVC.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 02/05/22.
//

import UIKit

class TestQuestionPopVC: UIViewController {

    @IBOutlet weak private(set) var continueButton: UIButton!
    @IBOutlet weak private(set) var progressBar1: ProgressBar!
    @IBOutlet weak private(set) var totalQuestion: UILabel!
    @IBOutlet weak private(set) var questionLeft: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        answerApiCall()
        questionLeft.text = String(questionClosure!() + 1)
        CommonProperties.commonProperties.buttonProperties(button: continueButton)
           }
    func  answerApiCall () {
        client.answerCount { result in
              switch result {
              case .success(let answer):
                  print("answer  dta  is ...\(String(describing: answer))")
                  answerCountData.data = answer!.data
                  self.questionLeft.text = "\(answerCountData.data.answerGivenByUser[0].totalAnswers)"
                  self.totalQuestion.text = "of \(answerCountData.data.totalQuestion[0].totalQuestions)"

                  print(answerCountData.data)
              case .failure(let error):
                  print("The applied error \(error)")
              }
          }
    }
    @IBAction private func backAction(_ sender: UIButton) {
      // print("rfdew",questionClosure)
        dismiss(animated: true, completion: nil)

    }
    @IBAction private func contnueAction(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(identifier: StringConstant.continueFeedBack.rawValue) as? FeedbackVC {
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)

    }
}
}
