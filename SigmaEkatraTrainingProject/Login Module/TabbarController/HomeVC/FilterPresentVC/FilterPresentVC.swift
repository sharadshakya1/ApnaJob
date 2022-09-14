//
//  FilterPresentVC.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 25/05/22.
//

import UIKit

class FilterPresentVC: UIViewController {
    @IBOutlet weak private(set) var tableView: UITableView!
    var onClicked : ((SearchName) -> Void)?
    var name :[SearchName] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        name = [SearchName(searchname: StringConstant.executiveBpo.rawValue),SearchName(searchname: StringConstant.foodDelivery.rawValue),SearchName(searchname: StringConstant.constructionLabour.rawValue),SearchName(searchname: StringConstant.callCenterOperator.rawValue)]
    }
    @IBAction private func backAction(_ sender: UIButton) {
//        guard  let controller = storyboard?.instantiateViewController(withIdentifier: StringConstant.tabController.rawValue) as? TabViewController else { return }
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .crossDissolve
//        present(controller, animated: true, completion: nil)
    }
}
