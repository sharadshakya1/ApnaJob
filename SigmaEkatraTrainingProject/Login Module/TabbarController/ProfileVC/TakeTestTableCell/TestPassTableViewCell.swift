//
//  TestPassTableViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 03/05/22.
//

import UIKit

class TestPassTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var ekatraTestLabel: UILabel!
    @IBOutlet weak private(set) var testOutlet: UIButton!
    @IBOutlet weak private(set) var testView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ekatraTestLabel.text = StringConstant.ekatraTest.localized
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        testView.layer.masksToBounds = false
        testView.layer.cornerRadius = 10
        // testView.layer.shadowColor = CGColor.g
        testView.layer.shadowOffset = CGSize(width: -1, height: 1)
        testView.layer.shadowOpacity = 0.2
        testView.layer.shadowRadius = 1
        // Configure the view for the selected state
    }
    @IBAction private func testAction(_ sender: UIButton) {

    }
}
