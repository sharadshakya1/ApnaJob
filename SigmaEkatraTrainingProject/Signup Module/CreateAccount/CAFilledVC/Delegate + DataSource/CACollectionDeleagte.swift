//
//  CACollectionDeleagte.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit
// MARK: - Delegate Methods
var name : String?
var date : String?
var email : String?
var gender : Int?
var salary : Int?
var expected :  Int?
var emailValidateClosure : (() -> Void)?
extension CreateAccountFilledVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch currentPage {
        case 0:
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.createAccountStep1CollectionViewCell.rawValue, for: indexPath) as?
                    CreateAccountStep1CollectionViewCell else {return UICollectionViewCell()}
            cell.locationOutlet.tag = indexPath.row
            cell.locationOutlet.addTarget(self, action: #selector(addToButton), for: .touchUpInside )
            if let str = locationClosure?() {
                print("d",str)
                cell.currentLocationLabel.text = str
            } else {
                cell.currentLocationLabel.text = "Location"
            }
//            emailValidateClosure = {
//                cell.resetData()
//            }
            clouser = {
//                self.progressView.progress -= progressClosure!()
                name = cell.nameField.text
                date = cell.dateField.text
                email = cell.emailText.text
            }
            return cell
        case 1:
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.createAccountStep2CollectionViewCell.rawValue, for: indexPath) as?
                    CreateAccountStep2CollectionViewCell else {return UICollectionViewCell()}
            cell.permanentButton.tag = indexPath.row
            cell.permanentButton.addTarget(self, action: #selector(addToButton), for: .touchUpInside )
            cell.presentLocationButton.tag = indexPath.row
            cell.presentLocationButton.addTarget(self, action: #selector(addToButton), for: .touchUpInside )
            if let str = presentLocationClosure?() {
                print("d",str)
                cell.preentLocationLabel.text = str
            } else {
                cell.preentLocationLabel.text = "District"
            }
            if let str = permanentLocationClosure?() {
                print("d",str)
                cell.permanentLocationLabel.text = str
            } else {
                cell.permanentLocationLabel.text = "District"
            }
            secondClouser = {
                if let name = name , let date = date ,let email =  email , let gender = genderObj.genderSelect , let latitude = lat ,let longitude = longi , let disLat = disCurLat , let disLong = disCurLong , let perlat = disPerLat , let perLong = disPerLong , let userType = userobj.userSelect {
                    self.client.create(username: name ,dateofBirth: date , emailAddress: email , gender: gender, lat: latitude , long: longitude ,disLat: disLat ,disLong: disLong , permaLong: perLong ,permaLat: perlat , usertype: userType) { result in
                        print(result)
                        switch result {
                        case .success(let login):
                            print("-----\(String(describing:login))")
                        case .failure(let error):
                            print("the error \(error)")
                        }
                    }
                }
            }
            return cell
        case 2:
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.createAddProfilePictureCollectionViewCell.rawValue, for: indexPath) as?
                    CreateAddProfilePicCollectionCell else {return UICollectionViewCell()}
            imagePickerClosure = {
                self.client.image(name: "MyImage", id: "7888") { result in
                    switch result {
                    case .success(let generate):
                        print("Your Otp is ...\(String(describing: generate))")
                    case .failure(let error):
                        print("The error \(error)")
                    }
                }
            }
            imageClosure = {
                let imageController  = UIImagePickerController()
                imageController.delegate = self
                imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imageController,animated: true ,completion: nil)
            }
            return cell
        case 3:
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier:  StringConstant.craeteAccountWorkExpCollectionViewCell.rawValue, for: indexPath) as?
                    CraeteAccountWorkExpCollectionViewCell else {return UICollectionViewCell()}
            storedWorkParameter = {
                salary = Int(cell.previousSalary.text!)
                expected = Int(cell.expectedSalary.text!)
            }
            return cell
        case 4:
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.createAccountWorkExpStep4CollectionViewCell.rawValue, for: indexPath) as?
                    CreateAccountWorkExpStep4CollectionCell else {return UICollectionViewCell()}
                        workExperienceClosure = {
                if  let education = edu , let genderSelection = expSelect.yesOrNo  ,let expected = expected , let previous = salary  , let type = prevExp {
                    self.client.workExp(education: education, expBool: genderSelection ,typeWorkExperience: type, previousSalary: previous , expectedSalary: expected , interestedJob: jobStore ) {result in
                        switch result {
                        case .success(let login):
                            print("-----\(String(describing:login))")
                        case .failure(let error):
                            print("the error \(error)")
                        }
                    }}
            }
            return cell
        case 5 :
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.createAccountAddVideoCollectionViewCell.rawValue, for: indexPath) as?
                    CreateAccountAddVideoCollectionViewCell else {return UICollectionViewCell()}
            return cell
        default:
            guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.createAccountAddLocationCollectionViewCell.rawValue, for: indexPath) as?
                    CreateAccountAddLocationCollectionCell else {return UICollectionViewCell()}
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    @objc func addToButton(sender :UIButton) {
        _ = IndexPath(row: sender.tag, section: 0)
        _ = UIStoryboard(name: StringConstant.main.rawValue, bundle: nil)
        guard let vc = self.storyboard?.instantiateViewController(identifier: "CreateAccountLocationViewController") as?
                CreateAccountLocationViewController else {return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
