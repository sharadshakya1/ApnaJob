//
//  PickerContollerDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit
import FirebaseStorage
var url1 : String?
var imageCrop : (() -> Void)?
var updateImage : ( () -> Void)?
extension CreateAccountFilledVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage = pickedImage
            updateImage?()
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
