//
//  EducationTableViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 02/05/22.
//

import UIKit

class EducationTableViewCell: UITableViewCell {

    @IBOutlet weak private(set) var education: UILabel!
    @IBOutlet weak private(set) var jobTyoe: UILabel!
    @IBOutlet weak private(set) var salary: UILabel!
    @IBOutlet weak private(set) var editEducation: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // self.profileName.text = userViewModel.data?[0].username
        if string1 == 1 {
            education.text = "Graduate"
        } else if  string1 == 2 {
            education.text = "PostGraduate"
        }
        else {
            education.text = "Diploma"
        }
        if  string2 == 1 {
            jobTyoe.text = "Construction Labour"
        }
        else if string2 == 2 {
            jobTyoe.text = "Call Center Operator"
        }
        else if string2 == 3 {
            jobTyoe.text = "Food delivery"
        }
        else if string2 == 4 {
            jobTyoe.text = "Other"
        }
        salary.text = string3
       // jobTyoe.text = string2
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
