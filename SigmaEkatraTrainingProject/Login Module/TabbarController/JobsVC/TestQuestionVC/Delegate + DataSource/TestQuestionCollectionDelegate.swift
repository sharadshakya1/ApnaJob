//
//  TestQuestionCollectionDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit
// MARK: - Delegate Methods
var rowClosure : (() -> Void)?
var questionId = String()
extension TestQuestionVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(question.count)
      //  return testQuestionData.data[0].questions[0].question.count
       // return testQuestionData.data.count
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: TestViewCollectionViewCell.identifier , for: indexPath) as?
            TestViewCollectionViewCell else {return UICollectionViewCell()}
        cell.questionLabel.text = testQuestionData.data?[0].questions?[indexPath.row].question
        cell.option1.text = testQuestionData.data?[0].questions?[indexPath.row].answers?[0]
        cell.option2.text = testQuestionData.data?[0].questions?[indexPath.row].answers?[0]
        cell.option3.text = testQuestionData.data?[0].questions?[indexPath.row].answers?[0]
        cell.option4.text = testQuestionData.data?[0].questions?[indexPath.row].answers?[0]
        cell.setupQuestion(self.question[indexPath.row])
        questionId = testQuestionData.data?[0].questions?[indexPath.row]._id ?? ""
        rowClosure = {
        if  let userAnswer = cell.option1.text {
            client.submitAnswer(questionId: questionId, userAnswer:userAnswer) { result in
                  switch result {
                  case .success(let answer):
                      print("answer  dta  is ...\(String(describing: answer))")
                   //   print("total ",testQuestionData.data[0].questions[].question)
                  case .failure(let error):
                      print("The applied error \(error)")
                  }
              }
        }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
