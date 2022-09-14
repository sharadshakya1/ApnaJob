//
//  ProfileViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 02/05/22.
//

import UIKit
var string1 = Int()
var string2 = Int()
var string3 = String()
var reloadClosure : (() -> Void)?
var imageDownload : (() -> Void)?
class ProfileViewController: UIViewController,UINavigationControllerDelegate ,UIImagePickerControllerDelegate {
    @IBOutlet weak private(set) var imageViewHider: UIView!
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak private(set) var tableView: UITableView!
    @IBOutlet private(set) var headerView: UIView!
    @IBOutlet weak private(set) var verifiedView: UIView!
    @IBOutlet weak private(set) var profileIMage: UIImageView!
    @IBOutlet weak private(set) var imageSetupView: UIView!
    @IBOutlet weak private(set) var cameraButton: UIButton!
    @IBOutlet weak private(set) var profileName: UILabel!
    @IBOutlet weak private(set) var phoneNumberLabel: UILabel!
    // MARK: - Register Nib
        func setup() {
            let nib = UINib(nibName:StringConstant.profileTableViewCell.rawValue , bundle: nil)
            tableView.register(nib, forCellReuseIdentifier:StringConstant.profileTableViewCell.rawValue )
            let nib2 = UINib(nibName: StringConstant.educationTableViewCell.rawValue, bundle: nil)
            tableView.register(nib2, forCellReuseIdentifier: StringConstant.educationTableViewCell.rawValue)
            let nib3 = UINib(nibName:StringConstant.testPassTableViewCell.rawValue , bundle: nil)
            tableView.register(nib3, forCellReuseIdentifier:StringConstant.testPassTableViewCell.rawValue )
            let nib4 = UINib(nibName:StringConstant.documentsTableViewCell.rawValue , bundle: nil)
            tableView.register(nib4, forCellReuseIdentifier:StringConstant.documentsTableViewCell.rawValue )
        }
    func userApiCall() {
        client.userDetails { result in
              switch result {
              case .success(let userDetails):
                  print("user  dta  is ...\(String(describing: userDetails))")
                  userViewModel.data = userDetails?.data
                 // self.profileIMage.image = userViewModel.data?[0].profileUrl
                  self.profileIMage.downloadImage(link:(userViewModel.data?[0].profileUrl)! , contentMode: .scaleAspectFill)
                  self.activityIndicator.stopAnimating()
                  self.imageViewHider.isHidden = true
                  self.profileName.text = userViewModel.data?[0].username
                  self.phoneNumberLabel.text = "Phone: \(userViewModel.data?[0].phoneNumber ?? 0)"
                  string1 = (userViewModel.data?[0].educationAndWorkDetails?[0].education ?? 0)
                  string2 = (userDetails?.data?[0].educationAndWorkDetails?[0].typeOfPreWorkExp?[0] ?? 0)
                  string3 = "₹ \(userViewModel.data?[0].educationAndWorkDetails?[0].previousSalary?[0] ?? 0) Per Month"
                  profileClosure?()
              case .failure(let error):
                  print("The applied error \(error)")
              }
          }
    }
}
    // MARK: - IBACtions
extension ProfileViewController {
    @IBAction private func galleryOpen(_ sender: UIButton) {
        let imageController  = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imageController,animated: true ,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileIMage.contentMode = .scaleAspectFill
            profileIMage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          dismiss(animated: true, completion: nil)
      }
    }
extension UIView {
    func roundCornerView(corners:UIRectCorner ,radius :CGFloat) {
        let path = UIBezierPath(roundedRect:self.bounds, byRoundingCorners: corners , cornerRadii: .init(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
// MARK: - LifeCycle Methods
extension ProfileViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        setup()
        self.activityIndicator.stopAnimating()
        navigationController?.isNavigationBarHidden =  true
        profileIMage.contentMode = .scaleAspectFill
        // profileIMage.layer.masksToBounds = true
        imageSetupView.layer.cornerRadius = (profileIMage.frame.size.height)/2
        imageSetupView.layer.borderColor = UIColor.white.cgColor
        imageSetupView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
        imageSetupView.layer.borderWidth = 4.0
        imageSetupView.layer.masksToBounds = true
        imageViewHider.isHidden = false
        activityIndicator.startAnimating()
       self.tableView.tableHeaderView = headerView
        cameraButton.layer.cornerRadius = 22
           cameraButton.clipsToBounds = true
        verifiedView.roundCornerView(corners: [.topLeft ,.bottomLeft], radius: 50)
        reloadClosure = {
            self.tableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        userApiCall()
        tableView.reloadData()
    }
}
