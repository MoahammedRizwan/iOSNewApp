//
//  UIImageView+Extension.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 09/08/23.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: String?, placeHolder: UIImage? = UIImage.init(systemName: "newspaper"), completed: (() -> Void)? = nil) {
        guard let imageUrlString = url  else {
            self.image = placeHolder
            return
        }
        let imageUrl = URL(string: imageUrlString)
        self.kf.setImage(with: imageUrl, placeholder: placeHolder, options: [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage,
        ], progressBlock: nil)
    }
}
