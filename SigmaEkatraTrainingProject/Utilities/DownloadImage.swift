//
//  DownloadImage.swift
//  SigmaEkatraTrainingProject
//
//  Created by Sharad Shakya on 29/06/22.
//

import Foundation
import UIKit
extension UIImageView {
   func downloadImage(link:String, contentMode: UIView.ContentMode) {
       guard let resourceURL = URL(string: link) else {
           fatalError()
       }
       let request = URLRequest(url: resourceURL)
       let dataTask = URLSession.shared.dataTask(with: request) { (data, _, _) in
           if let data = data {
               DispatchQueue.main.sync {
                   self.contentMode =  contentMode
                   self.image = UIImage(data: data)
               }
           }
       }
       dataTask.resume()
   }
}
