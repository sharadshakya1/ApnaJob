//
//  SEStoryBoard.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 20/06/22.
//

import Foundation
import UIKit
enum SEStoryBoard: String {
    case main = "Main"
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    func viewController<T: UIViewController>(VC: T.Type) -> T {
        let storyboardId = (VC as UIViewController.Type).storyboardId
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardId) as? T else {
            fatalError("ViewController  \(storyboardId), not found in \(self.rawValue) Storyboard")

        }
        return scene
    }
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    class var storyboardId: String {
        return "\(self)"
    }
    static func instantiate(fromAppStoryboard appStoryboard: SEStoryBoard) -> Self {
        return appStoryboard.viewController(VC: self)
    }
}
