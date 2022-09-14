//
//  SettingTableViewDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit
// MARK: - TableView Delegate and DataSource
extension SettingVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: StringConstant.settingTableViewCell.rawValue, for: indexPath) as? SettingTableViewCell else {return UITableViewCell() }
        cell.setup(settingInfo[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            let storyboard = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
            guard let vc = storyboard.instantiateViewController(identifier: StringConstant.changeLanguageVC.rawValue) as?
                    ChangeLanguageVC else {return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 1 :
            let storyboard = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
            guard let vc = storyboard.instantiateViewController(identifier: StringConstant.aboutVC.rawValue) as?
                    AboutVC  else {return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 2 :
            let storyboard = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
            guard let vc = storyboard.instantiateViewController(identifier: StringConstant.fAQVC.rawValue) as?
                    FAQVC else {return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 3 :
            let storyboard = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
            guard let vc = storyboard.instantiateViewController(identifier: StringConstant.termsConditionController.rawValue) as?
                    TermsAndConditionVC else {return }
            self.navigationController?.pushViewController(vc, animated: true)
        case 4 :
            logOutApiCall()
            if let controller = storyboard?.instantiateViewController(identifier: StringConstant.loginController.rawValue) as? LoginVC {
             controller.modalPresentationStyle = .fullScreen
             controller.modalTransitionStyle = .crossDissolve
             present(controller, animated: true, completion: nil)
            }
        default :
            let storyboard = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
            guard let vc = storyboard.instantiateViewController(identifier:StringConstant.changeLanguageVC.rawValue ) as?
                    AboutVC else {return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func logOutApiCall() {
        client.logOut() { result in
              switch result {
              case .success(let logout):
                  print("log Out SuccessFully ...\(String(describing: logout))")
                //  let authorToken = keychainAccess["token"] ?? ""
                  keychainAccess["token"] = ""
              case .failure(let error):
                  print("The applied error \(error)")
              }
          }
    }
}
