//
//  CreateAccountAddVideoViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 26/04/22.
//

import UIKit
import AVKit
import MobileCoreServices

class CreateAccountAddVideoViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak private(set) var videoImageView: UIImageView!
    @IBOutlet weak private(set) var imageUpperView: UIView!
    var videoAndImageView = UIImagePickerController()
    var videoURL : URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        imageUpperView.layer.borderWidth = 1
        imageUpperView.layer.borderColor = UIColor.white.cgColor
    }
    @IBAction private func recordAct(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            print("Camera Available")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            print("Camera UnAvailable")
        }
    }
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String : Any]) {
        dismiss(animated: true, completion: nil)
        guard let mediaType = info[UIImagePickerController.InfoKey.mediaURL.rawValue] as? String,
            mediaType == (kUTTypeMovie as String),
                let url = info[UIImagePickerController.InfoKey.mediaURL.rawValue] as? URL,
            UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path)
            else {
                return
        }
        // Handle a movie capture
        UISaveVideoAtPathToSavedPhotosAlbum(
            url.path,
            self,
            #selector(video(_:didFinishSavingWithError:contextInfo:)),
            nil)
    }
    @objc func video(_ videoPath: String, didFinishSavingWithError error: Error?, contextInfo info: AnyObject) {
        let title = (error == nil) ? "Success" : "Error"
        let message = (error == nil) ? "Video was saved" : "Video failed to save"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
