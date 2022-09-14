//
//  HomeCollectionViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 29/04/22.
//

import UIKit
class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private(set) var searchLabel: UILabel!
    @IBOutlet weak private(set) var labelView: UIView!
    @IBOutlet weak private(set) var deleteOutlet: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CommonProperties.commonProperties.viewProperties(view: labelView)
    }
}
extension HomeCollectionViewCell {
    func setup(_ name :SearchName) {
        searchLabel.text = name.searchname
    }
}
