//
//  HomeViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 29/04/22.
//

import UIKit
var update :(() -> Void)?
var id = String()
class HomeViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var findJobLabel: UILabel!
    @IBOutlet weak private(set) var searchBar: UISearchBar!
    @IBOutlet weak private(set) var taleView: UITableView!
    @IBOutlet weak private(set) var profileImage: UIImageView!
    @IBOutlet private(set) var headerView: UIView!
    var name : SearchName?
    // MARK: - Properties
    var searching = false

    var jobArr = [String]()
    var searchJob  = [String]()
    // MARK: - LifeCycle MEthods
    override func viewDidLoad() {
        super.viewDidLoad()
       // updateData()
        print("------------page reload --------")
        navigationController?.isNavigationBarHidden = true
        setup()
        update = {
            self.taleView.reloadData()
        }
        passFilterValue = {
            self.taleView.reloadData()
        }
        profileImage.layer.cornerRadius = 10
        // searchBar.barTintColor = UIColor(red: 33/255, green: 49/255, blue: 123/255, alpha: 1)
       // searchBar.backgroundColor = UIColor.red
//        profileImage.layer.masksToBounds = true
       // configureSearch()
        searchBar.delegate = self
        findJobLabel.text = StringConstant.findyourdreamjob.localized
        
     //   self.taleView.tableHeaderView = headerView
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("###############enter the page#############")
        taleView.reloadData()
    }
// MARK: Register Nib
    func setup() {
        let nib = UINib(nibName: StringConstant.homeTableViewCell.rawValue, bundle: nil)
        taleView.register(nib, forCellReuseIdentifier: StringConstant.homeTableViewCell.rawValue)
        let nib2 = UINib(nibName: StringConstant.homeStep2TableViewCell.rawValue, bundle: nil)
        taleView.register(nib2, forCellReuseIdentifier: StringConstant.homeStep2TableViewCell.rawValue)
    }
    }
