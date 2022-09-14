//
//  SettingTableViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 02/05/22.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet  private(set) var imageLogo: UIImageView!
    @IBOutlet weak private(set) var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(_ settingInfo :Setting) {
        imageLogo.image = settingInfo.iconImage
        infoLabel.text = settingInfo.title
    }
}
