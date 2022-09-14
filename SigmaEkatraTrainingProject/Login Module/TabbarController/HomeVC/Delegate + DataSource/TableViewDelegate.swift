//
//  TableViewDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit
// MARK: - TableView Delegate ,DataSource
var jobid = String()
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if searching {
        return 1 + searchJob.count
        } else {
            return 1 + getData.data!.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StringConstant.homeStep2TableViewCell.rawValue, for: indexPath)
                    as? HomeStep2TableViewCell else {return UITableViewCell()}
            cell.del = self
            if let nameM = self.name {
                cell.name.append(nameM)
                self.name = nil
            }
            return cell
        default:
            guard  let cell = tableView.dequeueReusableCell(withIdentifier: StringConstant.homeTableViewCell.rawValue, for: indexPath) as? HomeTableViewCell else {return UITableViewCell() }
            //cell.jobTitle.text =   getData.data?[indexPath.row].jobName
            if searching {
                cell.label.text = searchJob[indexPath.section - 1]
            } else {
                cell.label.text = getData.data?[indexPath.section - 1].jobName
                jobArr.append(cell.label.text ?? "")
                print("search data" ,jobArr)
                cell.opening.text = "\(getData.data?[indexPath.section - 1].opening ?? 0) Openings"
                cell.salary.text = "₹ \(getData.data?[indexPath.section - 1].salary ?? 0) Per Month"
                cell.company.text = getData.data?[indexPath.section - 1].companyName
                cell.companyImage.load(urlString: (getData.data?[indexPath.section - 1].companyNameUrl)!)
                cell.addedDays.text = "\(getData.data?[indexPath.section - 1].jobAddedDays ?? 0) Days ago"
                print(getData.data?[indexPath.section - 1].jobName,"fwrr",(jobid))
                print("name",getData.data?[indexPath.section - 1].jobName)
              //  UserDefaults.standard.set(jobid, forKey: "jobid")
                jobid = "\(getData.data?[indexPath.section - 1]._id ?? "")"
               // id = UserDefaults.standard.object(forKey: "jobid") as? String ?? ""
                print(id)
               // UserDefaults.standard.set(jobid , forKey: "jobid")
               // print("user" ,UserDefaults.standard.object(forKey: "jobid"))
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else {
            return 205
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1 :
            let storyboard = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
            guard let vc = storyboard.instantiateViewController(identifier: StringConstant.jobDetailViewController.rawValue) as?
                    JobDetailViewController else {return }
            vc.jobTitleString = data[indexPath.section - 1].title!
            vc.index2 = indexPath.section
            self.taleView.reloadData()
            // self.taleView.reloadData()
            self.navigationController?.pushViewController(vc, animated: true)
        default :
            let storyboard = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
            guard let vc = storyboard.instantiateViewController(identifier: StringConstant.jobDetailViewController.rawValue) as?
                    JobDetailViewController else {return }
            vc.jobTitleString = (getData.data?[indexPath.section - 1].jobName)!
            vc.index2 = indexPath.section
            vc.companyImage = (getData.data?[indexPath.section - 1].companyNameUrl)!
            vc.companyName = "\(getData.data?[indexPath.section - 1].companyName ?? "")"
            vc.jobIdi = jobid
            //"\(getData.data?[indexPath.section - 1].companyNameUrl ?? "")"
           // appliedJob.append(applied/Data.data[0].appliedJobDetails[indexPath.section].jobName)
         //   self.apicall(_name: getData.data?[indexPath.section - 1]._id ?? "")
            self.taleView.reloadData()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
   
}
/*
 let storyboard = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
 guard let vc = storyboard.instantiateViewController(identifier: StringConstant.jobDetailViewController.rawValue) as?
         JobDetailViewController else {return }
   vc.jobTitleString = jobArray[indexPath.section]
   vc.index = indexPath.section
self.tableView.reloadData()
 self.navigationController?.pushViewController(vc, animated: true)
}
 */
extension HomeViewController : sendClickAction {
    func sendActionFilter() {
        let storyboard = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: StringConstant.filterPresentVC.rawValue) as?
                FilterPresentVC else {return }
        if let presentationController = vc.presentationController as? UISheetPresentationController { presentationController.detents = [.medium()] 
            vc.onClicked = { data in
                self.name = data
                self.taleView.reloadData()
            }
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
  }
}
