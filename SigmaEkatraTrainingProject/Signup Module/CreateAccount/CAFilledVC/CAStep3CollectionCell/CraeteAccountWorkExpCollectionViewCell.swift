//
//  CraeteAccountWorkExpCollectionViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 28/04/22.
//

import UIKit
var closure : (() ->Void)?
var closure2 : (() ->Void)?
var closure3 : (() ->Void)?
// var reloadClosure : (() -> Void)?
class CraeteAccountWorkExpCollectionViewCell: UICollectionViewCell {
// MARK: - IBOutlets
    @IBOutlet weak private(set) var openEducation: UIButton!
    @IBOutlet weak private(set) var expectedSalary: UITextField!
    @IBOutlet weak private(set) var previousSalary: UITextField!
    @IBOutlet weak private(set) var categoryTextField: UITextField!
    @IBOutlet weak private(set) var jobField: UITextField!
    @IBOutlet weak private(set) var educationLabel: UILabel!
    @IBOutlet weak private(set) var yesImgView: UIView!
    @IBOutlet weak private(set) var noImgView: UIView!
    @IBOutlet weak  private(set) var previousExpTextField: UITextField!
    @IBOutlet weak private(set) var secondView: UIView!
    @IBOutlet weak private(set) var noButtonOutlet: UIButton!
    @IBOutlet weak private(set) var yesButtonOutlet: UIButton!
    @IBOutlet weak private(set) var thirdView: UIView!
    @IBOutlet weak private(set) var firstView: UIView!
    @IBOutlet weak private(set) var yesLabelView: UIView!
    @IBOutlet weak private(set) var noLabelView: UIView!
    @IBOutlet weak private(set) var yesLabel: UILabel!
    @IBOutlet weak private(set) var noLabel: UILabel!
    @IBOutlet weak private(set) var noImageView: UIView!
    @IBOutlet weak private(set) var yesImageView: UIView!
    @IBOutlet weak private(set) var imageView1: UIImageView!
    @IBOutlet weak private(set) var preferLocation: UITextField!
    @IBOutlet weak private(set) var imageView2: UIImageView!
    let piker1 = UIPickerView()
    let piker2 = UIPickerView()
    let piker3 = UIPickerView()
    let piker4 = UIPickerView()
    let education = ["GRADUATE", "POSTGRADUATE", "DIPLOMA"]
    let job = ["CONSTRUCTION_LABOR","CALL_CENTER_OPERATOR","FOOD_DELIVERY","OTHER"]
    let previousExp = ["CONSTRUCTION_LABOR","CALL_CENTER_OPERATOR","FOOD_DELIVERY","OTHER"]
    let preferLocate = ["NOIDA","CHANDIGARH","LUCKNOW","UTTARAKHAND"]
    var eduSelected : Int?
    // MARK: - Functions
    func dismissAndClosePickerView() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let button = UIBarButtonItem(title: StringConstant.done.rawValue, style: .plain, target: self, action:#selector(self.dismissAction))
        toolbar.setItems([button], animated: true)
        toolbar.isUserInteractionEnabled = true
        self.categoryTextField.inputAccessoryView = toolbar
        self.previousExpTextField.inputAccessoryView = toolbar
        self.jobField.inputAccessoryView = toolbar
       self.preferLocation.inputAccessoryView = toolbar
    }
    @objc func dismissAction() {
        closure!()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        closure2!()
    }
    @IBAction func openPicker(_ sender: UIButton) {
        dismissAndClosePickerView()
    }
}
// MARK: IBActions
extension CraeteAccountWorkExpCollectionViewCell {
    @IBAction  private func buttonAction(_ sender: UIButton) {
        sender.isSelected.toggle()
         switch sender.tag {
         case 1001 :
             print("Yes")
             expSelect.yesOrNo = true
             thirdView.isHidden = false
             secondView.isHidden = false
             firstView.isHidden = true
             noButtonOutlet.isSelected = false
             noLabelView.backgroundColor = .white
             yesLabelView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
         case 1002 :
             print("No")
             expSelect.yesOrNo = true
             thirdView.isHidden = false
             firstView.isHidden = false
             secondView.isHidden = true
             yesButtonOutlet.isSelected = false
             yesLabelView.backgroundColor = .white
             noLabelView.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
         default :
             print("No button")
}
}

    @IBAction private func addSection(_ sender: UIButton) {
        thirdView.isHidden = false
    }
}
// MARK: LifeCycle methods
extension CraeteAccountWorkExpCollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        dismissAndClosePickerView()
      //  thirdView.isHidden = true
        piker1.dataSource = self
        piker1.delegate = self
        piker2.dataSource = self
        piker2.delegate = self
        piker3.dataSource = self
        piker3.delegate = self
        piker4.delegate = self
        piker4.dataSource = self
        piker1.tag = 1
        piker2.tag = 2
        piker3.tag = 3
        piker4.tag = 4
        yesImgView.layer.masksToBounds = true
        yesImgView.layer.cornerRadius = (imageView1.frame.size.height)/2
        yesImgView.layer.borderColor = UIColor.lightGray.cgColor
        yesImgView.layer.borderWidth = 1.0
        noImgView.layer.masksToBounds = true
        noImgView.layer.cornerRadius = (imageView2.frame.size.height)/2
        noImgView.layer.borderColor = UIColor.lightGray.cgColor
        noImgView.layer.borderWidth = 1.0
        self.categoryTextField.inputView = piker1
        self.previousExpTextField.inputView = piker2
        self.jobField.inputView = piker4
        self.preferLocation.inputView = piker3
        CommonProperties.commonProperties.viewProperties(view: yesLabelView)
        CommonProperties.commonProperties.viewProperties(view: noLabelView)
     //  CommonProperties.commonProperties.viewProperties(view: yesImageView)
    //    CommonProperties.commonProperties.viewProperties(view: noImageView)
        imageView1.contentMode = .center
        imageView2.contentMode = .center
//        yesImageView.layer.cornerRadius = (yesImageView.frame.size.height)/2
//        noImageView.layer.cornerRadius = (noImageView.frame.size.height)/2
        firstView.isHidden = true
        secondView.isHidden = true
        thirdView.isHidden = true
    }
}
