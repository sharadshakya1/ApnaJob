//
//  TutorialVCDelegate.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 21/05/22.
//

import Foundation
import UIKit
// MARK: - Delegate Methods
extension TutorialScreenVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell =   collectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.collectioncell.rawValue , for: indexPath) as?
            OnboardingCollectionViewCell {
        if indexPath.row < 2 {
            //
            cell.setup(slides[indexPath.row])
            skipOutlet.isHidden = false
            nextButton.isHidden = false
            getStareted.isHidden = true
            //        print(cell)
        } else {
            cell.setup(slides[indexPath.row])
            skipOutlet.isHidden = true
            nextButton.isHidden = true
            getStareted.isHidden = false
        }
        // getStareted.isHidden = true
        return cell
    }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
