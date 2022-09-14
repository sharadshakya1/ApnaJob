//
//  ImaegDownload.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 22/06/22.
//

import Foundation
import UIKit
extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url) {

                if let image = UIImage(data: data) {
                    imageDownload?()
                    DispatchQueue.main.async {

                        self?.image = image
                                            }
                }
            }
        }
    }
}
