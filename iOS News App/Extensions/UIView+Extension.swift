//
//  UIView+Extension.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 09/08/23.
//

import UIKit

extension UIView {
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 1.5)
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.3
    }
}
