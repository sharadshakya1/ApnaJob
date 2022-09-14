//
//  JobsVC.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 29/04/22.
//

import UIKit
var arrayClosure : (() -> Void)?
class JobsVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var tableView: UITableView!
    @IBOutlet private(set) var headerView: UIView!
    @IBOutlet weak private(set) var searchJobBar: UISearchBar!
    var dataMain  = [JobTitle]()
    var dataMain2 = [JobAppliedResponse]()
    var search = false
    var jobArray = [String]()
    var searchJobTitle  = [String]()
    @IBOutlet weak private(set) var customSegementControl: CustomSegmentedControl! {
        didSet {
           customSegementControl.setButtonTitles(buttonTitles: [StringConstant.allJobs.rawValue,StringConstant.interestJobs.rawValue,StringConstant.appliedJobs.rawValue])
        }
    }
    // MARK: - Register Xib
    func setup() {
        let nib = UINib(nibName: StringConstant.homeTableViewCell.rawValue, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StringConstant.homeTableViewCell.rawValue)
        customSegementControl.delegate = self
        dataMain = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
}
//    func appliedCall () {
//    client.jobApplied(){ result in
//          switch result {
//          case .success(let jobApplied):
//              print("job applied dta  is ...\(String(describing: jobApplied))")
//              print("total job",appliedJob)
//              appliedData.data = jobApplied!.data
//              appliedJob.append(appliedData.data[0].appliedJobDetails[0].jobName)
//             // appliedData[].
//          case .failure(let error):
//              print("The applied error \(error)")
//          }
//      }
////        appliedClosure = {
//            appliedData[0].data[0].appliedJobDetails[0].jobName
//        }
//    }
//}
    @IBAction private func interested(_ sender: UIButton) {
        print("hello")
    }
}
// MARK: - LifeCycle methods
extension JobsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
       // appliedCall()
        navigationController?.isNavigationBarHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        searchJobBar.delegate = self
        setup()
       // self.tableView.tableHeaderView = headerView
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}
