//
//  ProfileTableViewDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit
// MARK: - TableView Delegate  , DataSource Methods
extension ProfileViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StringConstant.testPassTableViewCell.rawValue, for: indexPath)
                    as? TestPassTableViewCell else {return UITableViewCell()}
            cell.testOutlet.tag = indexPath.row
            cell.testOutlet.addTarget(self, action: #selector(addButton), for: .touchUpInside )
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StringConstant.profileTableViewCell.rawValue, for: indexPath)
                    as? ProfileTableViewCell else {return UITableViewCell()}
            cell.editOutlet.tag = indexPath.row
            cell.editOutlet.addTarget(self, action: #selector(addToButton), for: .touchUpInside )
            return cell
        case 2 :
            guard  let cell = tableView.dequeueReusableCell(withIdentifier:StringConstant.educationTableViewCell.rawValue , for: indexPath) as? EducationTableViewCell else {return UITableViewCell() }
            //cell.education.text = "\(userViewModel.data?[0].educationAndWorkDetails?[0].education ?? 0)"
            //cell.salary.text = 
            cell.editEducation.tag = indexPath.row
            cell.editEducation.addTarget(self, action: #selector(editDetails), for: .touchUpInside )
            return cell
        case 3 :
            guard  let cell = tableView.dequeueReusableCell(withIdentifier:StringConstant.documentsTableViewCell.rawValue , for: indexPath) as? DocumentsTableViewCell else {return UITableViewCell() }
            return cell
        default:
            guard  let cell = tableView.dequeueReusableCell(withIdentifier:StringConstant.documentsTableViewCell.rawValue , for: indexPath) as? DocumentsTableViewCell else {return UITableViewCell() }
            return cell
        }
    }
    @objc func addToButton(sender :UIButton) {
        _ = IndexPath(row: sender.tag, section: 0)
        _ = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
        guard  let controller = storyboard?.instantiateViewController(withIdentifier: StringConstant.updateVC.rawValue) as? UpdateVC else { return }
        present(controller, animated: true, completion: nil)
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 4
        }
    @objc func addButton(sender :UIButton) {
        //api call..... wait untill success.
        testApiCall()
        _ = IndexPath(row: sender.tag, section: 0)
        _ = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
}
    @objc func editDetails(sender :UIButton) {
        _ = IndexPath(row: sender.tag, section: 0)
        _ = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
        guard let vc = self.storyboard?.instantiateViewController(identifier: StringConstant.testController.rawValue) as?
        TestQuestionVC else {return }
        self.navigationController?.pushViewController(vc, animated: true)

    }
    func  testApiCall () {
        client.testQuestion { result in
              switch result {
              case .success(let question):
                  print("question  dta  is ...\(String(describing: question))")
                  testQuestionData.data = question!.data
                  collectionReloadClosure?()
                  guard let vc = self.storyboard?.instantiateViewController(identifier: StringConstant.testController.rawValue) as?
                  TestQuestionVC else {return }
                  self.navigationController?.pushViewController(vc, animated: true)
               //   print("total ",testQuestionData.data[0].questions[].question)
              case .failure(let error):
                  print("The applied error \(error)")
              }
          }
    }
}
