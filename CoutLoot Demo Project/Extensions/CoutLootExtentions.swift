//
//  CoutLootExtentions.swift
//  CoutLoot Demo Project
//
//  Created by Pranay Joshi on 26/07/20.
//  Copyright © 2020 Pranay Joshi. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Extension to show image on the imageview by using image url
extension UIImageView {
    public func imageFromURL(urlString: String) {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        let overlay: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        overlay.backgroundColor = UIColor.lightGray
        activityIndicator.startAnimating()
        if self.image == nil{
            self.addSubview(activityIndicator)
            self.addSubview(overlay)
        }
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                activityIndicator.removeFromSuperview()
                overlay.removeFromSuperview()
                if image == nil{
                    print("Image is broken or image url is not valid.")
                }else{
                    self.image = image
                    
                }
            })
        }).resume()
    }
}
