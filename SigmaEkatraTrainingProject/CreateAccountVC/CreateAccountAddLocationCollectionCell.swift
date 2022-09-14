//
//  CreateAccountAddLocationCollectionViewCell.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 28/04/22.
//

import UIKit

class CreateAccountAddLocationCollectionCell: UICollectionViewCell {
   // MARK: - IBOutelts
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

    // MARK: - IBActions
    @IBAction private func checkButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        object.labeltext  = 1
        // print(object.labeltext)
        //delegate?.jobpass(job: object.labeltext!)
       // print(JobPass.self)
        if sender.isSelected {
            checkButton2.isSelected = false
            checkButton3.isSelected = false
            checkButton4.isSelected = false
            checkButton5.isSelected = false
        }
    }
    @IBAction private func checkButton2(_ sender: UIButton) {
        sender.isSelected.toggle()
        object.labeltext  = 2
        if sender.isSelected {
            print("select")
            checkButton1.isSelected = false
            checkButton3.isSelected = false
            checkButton4.isSelected = false
            checkButton5.isSelected = false
        }
    }
    @IBAction private func checkButton3(_ sender: UIButton) {
        sender.isSelected.toggle()
        object.labeltext  = 3

       //  delegate?.jobpass(job: checkLabel3.text!)
        if sender.isSelected {
            checkButton1.isSelected = false
            checkButton2.isSelected = false
            checkButton4.isSelected = false
            checkButton5.isSelected = false
        }
    }
    @IBAction private func checkButton4(_ sender: UIButton) {
        sender.isSelected.toggle()
        object.labeltext  = 4

       //  delegate?.jobpass(job: checkLabel4.text!)
        if sender.isSelected {
            checkButton1.isSelected = false
            checkButton2.isSelected = false
            checkButton3.isSelected = false
            checkButton5.isSelected = false
        }
    }
    @IBAction private func checkButton5(_ sender: UIButton) {
        sender.isSelected.toggle()
        object.labeltext  = 5

       //  delegate?.jobpass(job: checkLabel5.text!)
        if sender.isSelected {
            checkButton1.isSelected = false
            checkButton2.isSelected = false
            checkButton3.isSelected = false
            checkButton4.isSelected = false
        }
    }
}
// MARK: - LifeCycle MEthods
extension CreateAccountAddLocationCollectionCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        CommonProperties.commonProperties.viewProperties(view: checkBoxView1)
        CommonProperties.commonProperties.viewProperties(view: checkBoxView2)
        CommonProperties.commonProperties.viewProperties(view: checkBoxView3)
        CommonProperties.commonProperties.viewProperties(view: checkBoxView4)
        CommonProperties.commonProperties.viewProperties(view: checkBoxView5)
    }
    
}
