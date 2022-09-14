//
//  AddProfilePictureViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 14/04/22.
//

//import UIKit
//
//class AddProfilePictureViewController: UIViewController, UINavigationControllerDelegate ,UIImagePickerControllerDelegate {
//
//    @IBOutlet weak private(set) var buttonImage: UIButton!
//    @IBOutlet weak private(set) var imageView: UIImageView!
//    @IBOutlet weak private(set) var viewForImage: UIView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//       
//        imageView.contentMode = .center
//        viewForImage.layer.masksToBounds = true
//        viewForImage.layer.cornerRadius = (viewForImage.frame.size.height)/2
//        viewForImage.layer.borderColor = UIColor.lightGray.cgColor
//        viewForImage.layer.borderWidth = 1.0
//        buttonImage.layer.masksToBounds = true
//        buttonImage.layer.cornerRadius = 10
//        imageView.contentMode = .center
//
////        profilePictureView.layer.cornerRadius = profilePictureView.frame.size.width/2
////        profilePictureView.clipsToBounds = true
////
////        profilePictureView.layer.borderColor = UIColor.whiteColor().CGColor
////        profilePictureView.layer.borderWidth = 5.0
//        // Do any additional setup after loading the view.
//    }
//   @IBAction  private func imageButton(_ sender: UIButton) {
//        let imageController  = UIImagePickerController()
//        imageController.delegate = self
//        imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
//        self.present(imageController,animated: true ,completion: nil)
//       guard let controller = (storyboard?.instantiateViewController(identifier:"MapLocationViewController")) as? CreateAccountWorkVC else {return}
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .crossDissolve
//        // UserDefaults.standard.hasOnboarded = true
//        present(controller, animated: true, completion: nil)
//
//    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            imageView.contentMode = .scaleAspectFill
//            imageView.image = pickedImage
//        }
//
//        dismiss(animated: true, completion: nil)
//    }
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//          dismiss(animated: true, completion: nil)
//      }
//}
