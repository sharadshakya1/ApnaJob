//
//  JobSearchBarDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit

// MARK: - UISEARCH BAR DELEGATE
extension JobsVC : UISearchBarDelegate {
func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    searchJobTitle  = jobArray.filter({$0.prefix(searchText.count) == searchText })
    print("Search title is " , searchJobTitle)
    search = true
    tableView.reloadData()
}
func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    search = false
    searchBar.text = ""
    tableView.reloadData()
}
}
