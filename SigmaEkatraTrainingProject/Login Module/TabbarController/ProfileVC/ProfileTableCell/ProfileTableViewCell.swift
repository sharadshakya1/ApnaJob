//
//  ProfileTableViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 02/05/22.
//

import UIKit
var profileClosure : (() -> Void)?
var genderString = Int()
class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak private(set) var dateoOfBirth: UILabel!
    @IBOutlet weak private(set) var emailAddress: UILabel!
    @IBOutlet weak private(set) var editOutlet: UIButton!
    @IBOutlet weak private(set) var gender: UILabel!
    @IBOutlet weak private(set) var location: UILabel!
    @IBOutlet weak private(set) var currentLocation: UILabel!
    @IBOutlet weak private(set) var permanentLocation: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileClosure = {
            self.dateoOfBirth.text = userViewModel.data?[0].dateOfBirth
            self.emailAddress.text = userViewModel.data?[0].emailAddress
            genderString = (userViewModel.data?[0].gender ?? 0)
        }
        if genderString == 1 {
            gender.text = "Male"
        }
        else if genderString == 2 {
            gender.text = "Female"
        }
        else if genderString == 3 {
            gender.text == "Other"
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
