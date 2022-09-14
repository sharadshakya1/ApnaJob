//
//  JobTableViewDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit
var titleString = ""
// MARK: - Delegate Methods
var appliedClosure : (() -> Void)?
extension JobsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StringConstant.homeTableViewCell.rawValue, for: indexPath)
                as? HomeTableViewCell else {return UITableViewCell()}
        if search {
            cell.label.text = searchJobTitle[indexPath.section]
        } else {
            cell.label.text = getData.data?[indexPath.section].jobName
            jobArray.append(getData.data?[indexPath.section].jobName ?? "")
            print("job array ", jobArray)
            cell.opening.text = "\(getData.data?[indexPath.section ].opening ?? 0) Openings"
            cell.salary.text = "₹ \(getData.data?[indexPath.section ].salary ?? 0) Per Month"
            cell.company.text = getData.data?[indexPath.section ].companyName
            cell.companyImage.load(urlString: (getData.data?[indexPath.section ].companyNameUrl)!)
            cell.addedDays.text = "₹ \(getData.data?[indexPath.section ].jobAddedDays ?? 0) Days ago"
//            titleString =  ("\(applieddata.data[0].appliedJobDetails[indexPath.section].jobName )")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
}
    func numberOfSections(in tableView: UITableView) -> Int {
        if search {
            return searchJobTitle.count
        }
        return dataMain.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyboard = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
            guard let vc = storyboard.instantiateViewController(identifier: StringConstant.jobDetailViewController.rawValue) as?
                    JobDetailViewController else {return }
        vc.jobTitleString = "\(getData.data?[indexPath.section].jobName ?? "")"
        vc.index2 = indexPath.section
       // vc.jobid = getData.data
        self.tableView.reloadData()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
//
