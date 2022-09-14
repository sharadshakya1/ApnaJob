//
//  CreateAccountWorkExpStep4CollectionViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 28/04/22.
//

import UIKit
var jobStore  = [String]()
class CreateAccountWorkExpStep4CollectionCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var checkBoxView2: UIView!
    @IBOutlet weak private(set) var checkBoxView3: UIView!
    @IBOutlet weak private(set) var checkBoxView4: UIView!
    @IBOutlet weak private(set) var checkBoxView5: UIView!
    @IBOutlet weak private(set) var checkBoxView1: UIView!
    @IBOutlet weak  private(set) var checkButton2: UIButton!
    @IBOutlet weak  private(set) var checkButton3: UIButton!
    @IBOutlet weak  private(set) var checkButton4: UIButton!
    @IBOutlet weak  private(set) var checkButton5: UIButton!
    @IBOutlet weak  private(set) var checkButton1: UIButton!

    @IBOutlet weak  private(set) var checkLabel1: UILabel!
    @IBOutlet weak  private(set) var checkLabel2: UILabel!
    @IBOutlet weak  private(set) var checkLabel3: UILabel!
    @IBOutlet weak  private(set) var checkLabel4: UILabel!
    @IBOutlet weak  private(set) var checkLabel5: UILabel!
   
}
// MARK: - IBActions
extension CreateAccountWorkExpStep4CollectionCell {
    @IBAction private func checkButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        jobStore.append(checkLabel1.text ?? "")
    }
    @IBAction private func checkButton2(_ sender: UIButton) {
        sender.isSelected.toggle()
        jobStore.append(checkLabel2.text ?? "")
    }
    @IBAction private func checkButton3(_ sender: UIButton) {
        sender.isSelected.toggle()
        jobStore.append(checkLabel3.text ?? "")
       // object.labeltext  = 3
       //  delegate?.jobpass(job: checkLabel3.text!)
    }
    @IBAction private func checkButton4(_ sender: UIButton) {
        sender.isSelected.toggle()
        jobStore.append(checkLabel4.text ?? "")
       //  delegate?.jobpass(job: checkLabel4.text!)
    }
    @IBAction private func checkButton5(_ sender: UIButton) {
        sender.isSelected.toggle()
        jobStore.append(checkLabel5.text ?? "")
      //  delegate?.jobpass(job: checkLabel5.text!)
    }
}
// MARK: - LifeCycleMethods
extension CreateAccountWorkExpStep4CollectionCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        CommonProperties.commonProperties.viewProperties(view: checkBoxView1)
        CommonProperties.commonProperties.viewProperties(view: checkBoxView2)
        CommonProperties.commonProperties.viewProperties(view: checkBoxView3)
        CommonProperties.commonProperties.viewProperties(view: checkBoxView4)
        CommonProperties.commonProperties.viewProperties(view: checkBoxView5)
    }
}
