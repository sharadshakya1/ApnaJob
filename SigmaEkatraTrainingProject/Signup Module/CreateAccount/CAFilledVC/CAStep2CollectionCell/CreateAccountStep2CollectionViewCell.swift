//
//  CreateAccountStep2CollectionViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 28/04/22.
//

import UIKit

var permanentLocationClosure : (() -> String)?
var presentLocationClosure : (() -> String)?

class CreateAccountStep2CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private(set) var preentLocationLabel: UILabel!
    @IBOutlet weak private(set) var permanentLocationLabel: UILabel!
    @IBOutlet weak private(set) var presentLocationButton: UIButton!
    @IBOutlet weak private(set) var permanentButton: UIButton!
    @IBOutlet weak private(set) var presentResidenceView: UIView!
    @IBOutlet weak private(set) var permanentResidenceView: UIView!
    @IBOutlet weak private(set) var loader: UIActivityIndicatorView!
}
// MARK: - Life CYcle MEthods
extension CreateAccountStep2CollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CommonProperties.commonProperties.viewProperties(view: presentResidenceView)
        CommonProperties.commonProperties.viewProperties(view: permanentResidenceView)
    }
}
