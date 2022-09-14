//
//  ViewController.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad on 04/04/22.
//

import UIKit

class TutorialScreenVC: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak private(set) var skipOutlet: UIButton!
    @IBOutlet weak private(set) var collectionView: UICollectionView!
    @IBOutlet weak private(set) var nextButton: UIButton!
    @IBOutlet weak private(set) var pageControl: UIPageControl!
    @IBOutlet weak private(set) var getStareted: UIButton!
    // MARK: - Properties
    var slides :[OnboardingSlides] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
}
// MARK: - IBActions
extension TutorialScreenVC {
   @IBAction  private func getStartedButton(_ sender: Any) {
       let storyboard = UIStoryboard(name:StringConstant.main.rawValue, bundle: nil)
       let vc = storyboard.instantiateViewController(withIdentifier: StringConstant.welcomeController.rawValue)
       self.navigationController?.pushViewController(vc, animated: true)

    }
   @IBAction  private func skipButton(_ sender: Any) {
      if let controller = storyboard?.instantiateViewController(identifier: StringConstant.welcomeController.rawValue) as? WelcomeVC {
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true, completion: nil)
       }
    }
   @IBAction  private func nextbutton(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
           if let controller = storyboard?.instantiateViewController(identifier: StringConstant.welcomeController.rawValue) as? WelcomeVC {
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .crossDissolve
            present(controller, animated: true, completion: nil)
            }
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.isPagingEnabled = false
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.isPagingEnabled = true
        }
    }
}
// MARK: - LifeCycle Methods
extension TutorialScreenVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getStareted.layer.masksToBounds = true
        getStareted.layer.cornerRadius = 10
        self.navigationController?.isNavigationBarHidden  = true
        skipOutlet.setTitle(StringConstant.skipButton.localized, for: .normal)
        skipOutlet.setTitleColor(UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0), for: .normal)
        skipOutlet.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .bold)
        getStareted.setTitle(StringConstant.getStarted.localized, for: UIControl.State.normal)
       // getStareted.setTitleColor(UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0), for: .normal)
        getStareted.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .bold)
       // getStareted.backgroundColor = UIColor(red: 33/255.0, green: 49/255.0, blue: 123/255.0, alpha: 1.0)
        getStareted.isHidden = true
        slides = [OnboardingSlides(title: StringConstant.slidestitle.localized, description:          StringConstant.slidesdescription.localized, image: #imageLiteral(resourceName: "tutorialLogo")),OnboardingSlides(title: StringConstant.slidestitle.localized, description: StringConstant.slidesdescription.localized, image: #imageLiteral(resourceName: "tutorialLogo2")),
            OnboardingSlides(title: StringConstant.slidestitle.localized, description: StringConstant.slidesdescription.localized,image: #imageLiteral(resourceName: "tutorialLogo3"))]
        pageControl.numberOfPages = slides.count
        // print(slides)
        self.collectionView.reloadData()
    }
}
