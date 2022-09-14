//
//  TestViewCollectionViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 27/04/22.
//

import UIKit

class TestViewCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: TestViewCollectionViewCell.self)
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var option1ButtonOutlet: UIButton!
    @IBOutlet weak private(set) var option2ButtonOutlet: UIButton!
    @IBOutlet weak private(set) var option3ButtonOutlet: UIButton!
    @IBOutlet weak  private(set) var option4ButtonOutlet: UIButton!
    @IBOutlet weak private(set) var questionnoLabel: UILabel!
    @IBOutlet weak private(set) var questionLabel: UILabel!
    @IBOutlet weak private(set)  var questionView2: UIView!
    @IBOutlet weak private(set) var questionView3: UIView!
    @IBOutlet weak private(set) var questionView4: UIView!
    @IBOutlet weak private(set) var questionView1: UIView!
    @IBOutlet weak private(set) var option1: UILabel!
    @IBOutlet weak private(set) var option2: UILabel!
    @IBOutlet weak private(set) var option3: UILabel!
    @IBOutlet weak private(set) var option4: UILabel!
}
// MARK: - IBActions
extension TestViewCollectionViewCell {
    @IBAction private func optionAction(_ sender: UIButton) {
        sender.isSelected.toggle()
         switch sender.tag {
         case 201 :
             option2ButtonOutlet.isSelected = false
             option3ButtonOutlet.isSelected = false
             option4ButtonOutlet.isSelected = false
             questionView2.backgroundColor = .white
             questionView3.backgroundColor = .white
             questionView4.backgroundColor = .white
             questionView1.backgroundColor = UIColor(red: 49/255.0, green: 165/255.0, blue: 97/255.0, alpha: 1.0)
         case 202 :
             option1ButtonOutlet.isSelected = false
             option3ButtonOutlet.isSelected = false
             option4ButtonOutlet.isSelected = false
             questionView1.backgroundColor = .white
             questionView3.backgroundColor = .white
             questionView4.backgroundColor = .white
             questionView2.backgroundColor = UIColor(red: 49/255.0, green: 165/255.0, blue: 97/255.0, alpha: 1.0)
         case 203 :
             option2ButtonOutlet.isSelected = false
             option1ButtonOutlet.isSelected = false
             option4ButtonOutlet.isSelected = false
             questionView2.backgroundColor = .white
             questionView1.backgroundColor = .white
             questionView4.backgroundColor = .white
             questionView3.backgroundColor = UIColor(red: 49/255.0, green: 165/255.0, blue: 97/255.0, alpha: 1.0)
         case 204 :
             option2ButtonOutlet.isSelected = false
             option3ButtonOutlet.isSelected = false
             option1ButtonOutlet.isSelected = false
             questionView2.backgroundColor = .white
             questionView3.backgroundColor = .white
             questionView1.backgroundColor = .white
             questionView4.backgroundColor = UIColor(red: 49/255.0, green: 165/255.0, blue: 97/255.0, alpha: 1.0)
         default :
             print("No button")
         }
    }
}
// MARK: - Private Functions
extension TestViewCollectionViewCell {
    func setupQuestion(_ question : Question) {
        option1ButtonOutlet.isSelected = false
        option2ButtonOutlet.isSelected = false
        option3ButtonOutlet.isSelected = false
        option4ButtonOutlet.isSelected = false
        questionnoLabel.text = question.title
       // questionLabel.text = question.desc
       // testQuestionData.data[1].questions[1].question
        //testQuestionData.data[currentPage].questions[currentPage].question
//        option1.text = question.question1
//        option2.text = question.question2
//        option3.text = question.question3
//        option4.text = question.question4
        self.setDefaultView(viewSet: questionView1)
        self.setDefaultView(viewSet: questionView2)
        self.setDefaultView(viewSet: questionView3)
        self.setDefaultView(viewSet: questionView4)
    }
    private func setDefaultView(viewSet: UIView) {
        viewSet.layer.masksToBounds = true
        viewSet.layer.cornerRadius = 10
        viewSet.layer.borderWidth = 2
        viewSet.backgroundColor = .white
        viewSet.layer.borderColor = CGColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 0.5)
    }
}
