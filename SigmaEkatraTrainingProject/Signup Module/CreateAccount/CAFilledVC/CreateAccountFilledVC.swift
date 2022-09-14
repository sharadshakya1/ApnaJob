//
//  PracticeViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 27/04/22.
//

import UIKit
var progressClousure : (() -> Void)?
var clouser : (() -> Void)?
var interestedString : String = ""
var secondClouser : (() -> Void)?
var storedWorkParameter : (() -> Void)?
var workExperienceClosure : (() ->  Void)?
var refreshClosure : (() -> Void)?
var imagePickerClosure : (() -> Void)?
var collectionReloadClosure : (() -> Void)?
var buttonEnabledClosure : (() -> Void)?
var buttonDisabledClosure : (() -> Void)?

class CreateAccountFilledVC: UIViewController ,UINavigationControllerDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var ekatraLogo: UIImageView!
    @IBOutlet weak private(set) var progressView: UIProgressView!
    @IBOutlet weak private(set) var collectionView: UICollectionView!
    @IBOutlet weak private(set) var nextOutlet: UIButton!
    var register : [Registration] = []
    var currentPage  = 0
    private var progress : Float = 0.0
    var client = Project()
    var list :[(() -> Void)] = []
    // MARK: - REGISTER NIB
    func setup() {
        let nib = UINib(nibName: StringConstant.createAccountStep1CollectionViewCell.rawValue, bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: StringConstant.createAccountStep1CollectionViewCell.rawValue)
        let nib2 = UINib(nibName: StringConstant.createAccountStep2CollectionViewCell.rawValue, bundle: nil)
        self.collectionView.register(nib2, forCellWithReuseIdentifier: StringConstant.createAccountStep2CollectionViewCell.rawValue)
        let nib3 = UINib(nibName: StringConstant.createAddProfilePictureCollectionViewCell.rawValue, bundle: nil)
        self.collectionView.register(nib3, forCellWithReuseIdentifier: StringConstant.createAddProfilePictureCollectionViewCell.rawValue)
        let nib4 = UINib(nibName: StringConstant.craeteAccountWorkExpCollectionViewCell.rawValue, bundle: nil)
        self.collectionView.register(nib4, forCellWithReuseIdentifier: StringConstant.craeteAccountWorkExpCollectionViewCell.rawValue)
        let nib5 = UINib(nibName: StringConstant.createAccountWorkExpStep4CollectionViewCell.rawValue, bundle: nil)
        self.collectionView.register(nib5, forCellWithReuseIdentifier: StringConstant.createAccountWorkExpStep4CollectionViewCell.rawValue)
        let nib6 = UINib(nibName: StringConstant.createAccountAddVideoCollectionViewCell.rawValue, bundle: nil)
        self.collectionView.register(nib6, forCellWithReuseIdentifier: StringConstant.createAccountAddVideoCollectionViewCell.rawValue)
        let nib7 = UINib(nibName: StringConstant.createAccountAddLocationCollectionViewCell.rawValue, bundle: nil)
        self.collectionView.register(nib7, forCellWithReuseIdentifier: StringConstant.createAccountAddLocationCollectionViewCell.rawValue)
    }
}
// MARK: - IBActions
extension CreateAccountFilledVC {
    @IBAction private func  nextAction(_ sender: UIButton) {
        if sender.tag == 1 {
            currentPage -= 1
            progressView.progress -= progress
            if currentPage < 0 {
                currentPage = 0 
                self.navigationController?.popViewController(animated: true)
            }
            let indexPath = IndexPath(item: currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
             } else {
                 if currentPage == 0 {
                    // clouser!()
                     
                   } else if currentPage == 1 {
                    // secondClouser?()
                 } else  if currentPage == 2 {
                      // imagePickerClosure!()
                 } else   if currentPage == 3 {
                     
                      // storedWorkParameter?()
                   //  refreshClosure?()
                  } else if currentPage == 4 {
                     // workExperienceClosure?()
                 }
                 currentPage += 1
                 progressView.progress += progress
                 if currentPage == 7 - 1 {
                     updateData()
                     interestedJobApi()
                     let storyboard = UIStoryboard(name:StringConstant.main.rawValue, bundle: nil)
                         let vc = storyboard.instantiateViewController(withIdentifier: StringConstant.tabController.rawValue)
                     self.navigationController?.pushViewController(vc, animated: true)
                 }
                 let indexPath = IndexPath(item: currentPage, section: 0)
                 self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
             }
         }
    func updateData() {
          client.job() { result in
            switch result {
            case .success(let create):
                print("job  dta  is ...\(String(describing: create))")
                getData.data = create?.data
                print("data",getData.data)
                update?()
            //    print("hello",getData.data?[0].jobName)
            case .failure(let error):
                print("The error \(error)")
            }
        }
    }
    func  interestedJobApi() {
        client.interestedJob() {
            result in
            switch result {
            case .success(let interested):
                print("interested  dta  is ...\(String(describing: interested))")
                interestedData.data = interested?.data
                interestedString = interestedData.data?[0].jobName ?? ""
                data1.append(JobTitle(title : interestedString))
            case .failure(let error):
                print("The error \(error)")
            }
        }
            }
        }
// MARK: - LIFE CycleMethods
extension CreateAccountFilledVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        closure = {
                self.view.endEditing(true)
            }
        closure2 = {
            self.view.endEditing(false)
        }
//        thirdClousure = {
//            self.view.endEditing(true)
//        }
        progressClosure = {
            self.progress
        }
        self.navigationController?.isNavigationBarHidden = true
        CommonProperties.commonProperties.buttonProperties(button: nextOutlet)
        ekatraLogo.image = UIImage(named: StringConstant.ekatraLogo.localized)
        collectionView.delegate = self
        collectionView.dataSource = self
        // collectionView?.prefetchDataSourcer
        progressView.progress = 0.0
        progress = Float(1.0 / Double(6.0))
        collectionReloadClosure  = {
            self.currentPage
        }
        refreshClosure = {
            self.collectionView.reloadData()
        }
        buttonDisabledClosure = {
            self.nextOutlet.isEnabled = false
        }
        buttonEnabledClosure = {
            self.nextOutlet.isEnabled = true
        }
//        if currentPage == 0 {
//            emailValidateClosure?()
//        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }
}
