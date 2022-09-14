//
//  JobDetailViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 26/04/22.
//

import UIKit

class JobDetailViewController: UIViewController {
    // MARK: - IBOutlets
    var jobTitleString = ""
    var index2 : Int = 0
    var companyImage = ""
    var companyName = ""
    var jobIdi = ""
    //var jobid :  String = ""
    @IBOutlet weak private(set) var timeLabel: UILabel!
    @IBOutlet weak private(set) var jobTitle: UILabel!
    @IBOutlet weak private(set) var jobIdLabel: UILabel!
    @IBOutlet weak private(set) var companyLogo: UIImageView!
    @IBOutlet weak private(set) var companyname: UILabel!
    @IBOutlet weak private(set) var callImage: UIImageView!
    @IBOutlet weak private(set) var educationLabel: UILabel!
    @IBOutlet weak private(set) var namelabel: UILabel!
    @IBOutlet weak private(set) var workingDay: UILabel!
    @IBOutlet weak private(set) var shiftTimings: UILabel!
    @IBOutlet weak private(set) var applyJob: UIButton!
    @IBOutlet weak private(set) var logoView: UIView!
    @IBOutlet weak private(set) var firstLabel: UILabel!
    @IBOutlet weak private(set) var resultLabel: UILabel!
    @IBOutlet weak private(set) var phoneNumber: UILabel!
    @IBOutlet weak private(set) var emailAddress: UILabel!
    @IBOutlet weak private(set) var contactTiming: UILabel!
}
// MARK: - functions
extension JobDetailViewController {
    func add(stringList: [String],
             font: UIFont,
             bullet: String = "\u{2022}",
             indentation: CGFloat = 20,
             lineSpacing: CGFloat = 1,
             paragraphSpacing: CGFloat = 12,
             textColor: UIColor = .gray,
             bulletColor: UIColor = .black) -> NSAttributedString {
        let textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: textColor]
        let bulletAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: bulletColor]
        let paragraphStyle = NSMutableParagraphStyle()
        let nonOptions = [NSTextTab.OptionKey: Any]()
        paragraphStyle.tabStops = [
            NSTextTab(textAlignment: .left, location: indentation, options: nonOptions)]
        paragraphStyle.defaultTabInterval = indentation
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.paragraphSpacing = paragraphSpacing
        paragraphStyle.headIndent = indentation
        let bulletList = NSMutableAttributedString()
        for string in stringList {
            let formattedString = "\(bullet)\t\(string)\n"
            let attributedString = NSMutableAttributedString(string: formattedString)
            attributedString.addAttributes([NSAttributedString.Key.paragraphStyle : paragraphStyle],range: NSMakeRange(0, attributedString.length))
            attributedString.addAttributes(textAttributes,range: NSMakeRange(0, attributedString.length))
            let string:NSString = NSString(string: formattedString)
            let rangeForBullet:NSRange = string.range(of: bullet)
            attributedString.addAttributes(bulletAttributes, range: rangeForBullet)
            bulletList.append(attributedString)
        }
        return bulletList
    }
}
    // MARK: IBACtions
extension JobDetailViewController {
    @IBAction private func backAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction private func applyJob(_ sender: UIButton) {
        client.jobApply(){ result in
              switch result {
              case .success(let jobApply):
                  print("job apply dta  is ...\(String(describing: jobApply))")
              case .failure(let error):
                  print("The error \(error)")
              }
          }
        //appliedClosure?()
        client.jobApplied(){ result in
            switch result {
            case .success(let jobApplied):
                print("job apply dta  is ...\(String(describing: jobApplied))")
                applieddata.data = jobApplied!.data
                dataJob.append(JobTitle(title:self.jobTitleString))
                print("llll" , dataJob)
            case .failure(let error):
                print("The error \(error)")
            }
        }
    }
    @IBAction private func interestedJob(_ sender: UIButton) {
        data[index2].jobIsInterested = true
    }
    @IBAction private func jobAction(_ sender: UIButton) {
        resultLabel.isHidden = false
        resultLabel.text = "You have already passed your EKATRA Test"
        resultLabel.font = UIFont.systemFont(ofSize: 14)
        callImage.image = UIImage(named:"colorCallImage")
        resultLabel.textAlignment = .center
    }
    func apicall () {
        client.jobDetail(){ result in
              switch result {
              case .success(let create):
                  print("detail dta  is ...\(String(describing: create))")
                  jobData1.data = create?.data
                  //UserDefaults.standard.set(jobid, forKey: "jobid")
                  
                  //self.taleView.reloadData()
              case .failure(let error):
                  print("The error \(error)")
              }
          }
        }
}
extension JobDetailViewController {
    // MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        apicall()
        jobIdLabel.isHidden = true
        jobIdLabel.text = jobIdi
        jobTitle.text = jobTitleString
        companyLogo.load(urlString: companyImage)
        companyname.text = companyName
        firstLabel.text = jobData1.data?.requirements
        self.educationLabel.text = jobData1.data?.educationAndTiming?.education
        self.workingDay.text = jobData1.data?.educationAndTiming?.workingDays
        self.shiftTimings.text = jobData1.data?.educationAndTiming?.shiftTimings
        self.namelabel.text = jobData1.data?.personOfContact?.name
        self.phoneNumber.text = jobData1.data?.personOfContact?.phoneNumber
        self.emailAddress.text = jobData1.data?.personOfContact?.emailAddress
        self.contactTiming.text = jobData1.data?.personOfContact?.preferredTimeForContacting
        logoView.layer.cornerRadius = 10
        logoView.layer.borderColor = UIColor.lightGray.cgColor
        logoView.layer.borderWidth = 1.0
        logoView.layer.masksToBounds = true
        CommonProperties.commonProperties.buttonProperties(button: applyJob)
       // firstLabel.text = "We hiring for candidates and some employees for CCE for BPO inbound with no target voice process.Hiring for domestic or international process for both day and night shifts.Fresher and experience Candidate Apply"
         let arrayString = [
            "Shift Timing : 6:00 to 3:00 PM or 10:00 to 6:00PM" ,
            "5 Days Working" ,
            "Rotational Off" ,
            "Hourly basis salary" ,
            "Minimum 115 Rupees in 1 hour ,9 hours shift .",
            "Maximum 175 Rupees If a person is from same profile collection",
            "2K Attendance Bonus + 5k Quarterly Bonus"
        ]
        callImage.image = UIImage(named:"callLogo" )
        resultLabel.isHidden = true
        timeLabel.numberOfLines = 0
        timeLabel.attributedText = add(stringList: arrayString, font: timeLabel.font, bullet: "•")
//        firstLabel.text = jobData1.data?.requirements
    }
      // firstLa
    override func viewWillAppear(_ animated: Bool) {
        self.jobTitle.text = jobTitleString
    }
}
