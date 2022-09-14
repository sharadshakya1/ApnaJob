//
//  FilterDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 25/05/22.
//

import Foundation
import UIKit
var passFilterValue :  ( () -> Void)?
// MARK: - TableView Delegate
extension FilterPresentVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StringConstant.filterTableViewCell.rawValue, for: indexPath)
                as? FilterTableViewCell else {return UITableViewCell()}
        cell.textLabel?.text = name[indexPath.row].searchname
        cell.selectionStyle = .none
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        self.onClicked?(name[indexPath.row])
        self.tapbutton(name[indexPath.row].searchname)
        passFilterValue?()
        dismiss(animated: true, completion: nil)
}
    func tapbutton ( _ name : String) {
        client.filter(jobName:name){ result in
              switch result {
              case .success(let create):
                  print("filter dta  is ...\(String(describing: create))")
                  getData.data = create?.data
                  print("Sharad: - ",create?.data)
                  passFilterValue?()
                  self.tableView.reloadData()
              case .failure(let error):
                  print("The error \(error)")
              }
          }
        }
}
