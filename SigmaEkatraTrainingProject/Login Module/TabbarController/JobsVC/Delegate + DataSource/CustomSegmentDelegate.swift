//  CustomSegmentDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.

import Foundation
import UIKit

// MARK: - CustomSegmentControl Delegate
extension JobsVC : CustomSegmentedControlDelegate {
    func change(to index: Int) {
        switch index {
        case 0:
            dataMain = data
        case 1:
            dataMain = data1
        case 2:
            dataMain = dataJob
        default:
            dataMain = []
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// data1.append(appliedData.data[0].appliedJobDetails[0].jobName)
