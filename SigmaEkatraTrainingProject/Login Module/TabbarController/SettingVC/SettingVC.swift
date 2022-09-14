//
//  SettingVC.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 02/05/22.
//

import UIKit

class SettingVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var tableView: UITableView!
    var settingInfo : [Setting] = []
    // MARK: -  SettingTableViewCell
    func setup() {
        let nib = UINib(nibName:StringConstant.settingTableViewCell.rawValue, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StringConstant.settingTableViewCell.rawValue)
    }
}
// MARK: - LifeCycle Methods
extension SettingVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        languageClosure = {
            self.tableView.reloadData()
        }
        setup()
        settingInfo = [Setting(iconImage: #imageLiteral(resourceName: "chooselanguage") ,title: "Change Language"),Setting(iconImage: #imageLiteral(resourceName: "aboutUs"),title: "About us") ,Setting(iconImage: #imageLiteral(resourceName: "faq"),title: "FAQ's"),Setting(iconImage: #imageLiteral(resourceName: "termsAndCond"),title:"Terms & Condition" ),Setting(iconImage: #imageLiteral(resourceName: "logOut") ,title: "Logout")  ]
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.isNavigationBarHidden = true
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        tableView.reloadData()
//    }
}
