//
//  OnboardingCollectionViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 05/04/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOUTLETS
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    @IBOutlet weak private(set) var imageview: UIImageView!
    @IBOutlet weak private(set) var titlelabel: UILabel!
    @IBOutlet weak private(set) var descriptionlabel: UILabel!
}

extension OnboardingCollectionViewCell {
    func setup(_ slide :OnboardingSlides) {
        imageview.image = slide.image
        titlelabel.text = slide.title
        descriptionlabel.text = slide.description
    }
}
