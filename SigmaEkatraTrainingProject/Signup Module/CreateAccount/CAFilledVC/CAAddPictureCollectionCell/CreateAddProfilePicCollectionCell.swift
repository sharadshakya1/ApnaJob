//
//  CreateAddProfilePictureCollectionViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 28/04/22.
//

import UIKit
var imageClosure : (() ->Void)?
var imageSelect : (() -> Void)?
var image : UIImage?
class CreateAddProfilePicCollectionCell: UICollectionViewCell {
    @IBOutlet weak private(set) var buttonImage: UIButton!
    @IBOutlet weak private(set) var imageView: UIImageView!
    @IBOutlet weak private(set) var viewForImage: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewForImage.layer.masksToBounds = true
        viewForImage.layer.cornerRadius = (viewForImage.frame.size.height)/2
        viewForImage.layer.borderColor = UIColor.lightGray.cgColor
        viewForImage.layer.borderWidth = 1.0
        buttonImage.layer.masksToBounds = true
        buttonImage.layer.cornerRadius = 10
    }
    @IBAction  private func imageButton(_ sender: UIButton) {
        updateImage = {
            self.imageView.image = profileImage
        }
        imageClosure?()
}
}
