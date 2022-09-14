//
//  HomeTableViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 29/04/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
   // var Create = JobResponse()
    var getData = JobResponse(statusCode: 0, success: false, data: [Data2(location: Location(type: "", coordinates: [0.0]), _id: "", jobName: "", salary: 0, opening: 0, companyName: "", companyNameUrl: "", jobAddedDays: 0)], message: "", type: "")
    @IBOutlet weak private(set) var jobInfoView: UIView!
    @IBOutlet weak private(set) var label : UILabel!
    @IBOutlet weak private(set) var addedDays: UILabel!
    @IBOutlet weak private(set) var salary: UILabel!
    @IBOutlet weak private(set) var company: UILabel!
    @IBOutlet weak private(set) var opening: UILabel!
    @IBOutlet weak private(set) var companyLogoView: UIView!
    @IBOutlet weak private(set) var companyImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        jobInfoView.layer.masksToBounds = false
        jobInfoView.layer.cornerRadius = 10
        // testView.layer.shadowColor = CGColor.g
        jobInfoView.layer.shadowOffset = CGSize(width: -1, height: 1)
        jobInfoView.layer.shadowOpacity = 0.2
        jobInfoView.layer.shadowRadius = 1
        CommonProperties.commonProperties.viewProperties(view:companyLogoView)
       // jobTitle.text =  getData.data?[0].jobName
    }
}
