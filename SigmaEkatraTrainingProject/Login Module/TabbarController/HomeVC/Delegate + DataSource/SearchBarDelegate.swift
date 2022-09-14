//
//  SearchBarDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//
import Foundation
import UIKit
// MARK: - Search Delegates
extension HomeViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchJob  = jobArr.filter({$0.prefix(searchText.count) == searchText })
        print("search" ,searchJob)
        searching = true
        taleView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        taleView.reloadData()
    }
}
//
