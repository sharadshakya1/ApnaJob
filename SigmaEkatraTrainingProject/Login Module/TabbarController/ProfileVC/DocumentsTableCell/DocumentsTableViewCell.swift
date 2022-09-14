//
//  DocumentsTableViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 03/05/22.
//

import UIKit

class DocumentsTableViewCell: UITableViewCell {

    @IBOutlet weak private(set) var verifiedWhiteView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        verifiedWhiteView.roundCorner(corners: [.topLeft ,.bottomLeft], radius: 50)
        // Configure the view for the selected state
    }
}
extension UIView {
    func roundCorner(corners:UIRectCorner ,radius :CGFloat) {
        let path = UIBezierPath(roundedRect:self.bounds, byRoundingCorners: corners , cornerRadii: .init(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
