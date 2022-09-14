//
//  TestQuestionViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 27/04/22.
//

import UIKit

var questionClosure : (() -> Int)?
var progressClosure :(() ->Float)?
var collectionloadClosure : (() -> Void)?
var currentPage = 0
class TestQuestionVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var collectionView: UICollectionView!
    @IBOutlet weak private(set) var progressView: UIProgressView!
    @IBOutlet weak private(set) var noLabel: UILabel!
    @IBOutlet weak private(set) var nextButtonOutlet: UIButton!
    // MARK: - Internal Properties
    var question :[Question] = []
    private var progress : Float = 0.0
   
}
// MARK: - IBActions
extension TestQuestionVC {
    @IBAction private func nextAction(_ sender: UIButton) {
        noLabel.text = String(currentPage + 2)
        progressView.progress += progress
        if currentPage == 15 - 1 {
                 let storyboard = UIStoryboard(name:StringConstant.main.rawValue, bundle: nil)
                 let vc = storyboard.instantiateViewController(withIdentifier: StringConstant.profileViewController.rawValue)
                 self.navigationController?.pushViewController(vc, animated: true)
             } else {
                 currentPage += 1
                 rowClosure?()
                 print("inc",currentPage)
                 let indexPath = IndexPath(item: currentPage, section: 0)
                 self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                 print("...",currentPage)
                 
                 questionClosure = {
                     return currentPage
                 }
                // print("greg",questionClosure)
             }
         }
    @IBAction private func backAction(_ sender: UIButton) {
        if currentPage != 15 - 1 {
            print("rfdew",questionClosure!())
            if let controller = storyboard?.instantiateViewController(identifier: "TestQuestionPopVC") as? TestQuestionPopVC {
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true, completion: nil)
        } else {
                if let controller = storyboard?.instantiateViewController(identifier: StringConstant.tabController.rawValue) as? TabViewController {
                controller.modalPresentationStyle = .fullScreen
                controller.modalTransitionStyle = .crossDissolve
                present(controller, animated: true, completion: nil)
            }
    }
}
}
    
}
extension TestQuestionVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0.0
        collectionView.delegate = self
        collectionView.dataSource = self
        questionClosure = {
            return currentPage
        }
        collectionloadClosure = {
            self.collectionView.reloadData()
        }
        CommonProperties.commonProperties.buttonProperties(button: nextButtonOutlet)
        question = [Question(title: "Question no: 1"),Question(title: "Question no: 2"),Question(title: "Question no: 3"),Question(title: "Question no: 4"),Question(title: "Question no: 5"),Question(title: "Question no: 6"),Question(title: "Question no: 7"),Question(title: "Question no: 8"),Question(title: "Question no: 9"),Question(title: "Question no: 10"),Question(title: "Question no: 11"),Question(title: "Question no: 12"),Question(title: "Question no: 13"),Question(title: "Question no: 14"),Question(title: "Question no: 15")]
        progress = Float(1.0 / Double(15))
        progressClosure = {
            return self.progress
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }
}
