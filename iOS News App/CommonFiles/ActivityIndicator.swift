//
//  ActivityIndicator.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 09/08/23.
//

import UIKit

@discardableResult
func ActivityIndicator(_ viewContainer: UIView, startAnimate: Bool? = true) -> UIActivityIndicatorView {

    let mainContainer: UIView = UIView(frame: viewContainer.frame)
    mainContainer.center = viewContainer.center
    mainContainer.backgroundColor = UIColor.white
    mainContainer.alpha = 0.8
    mainContainer.tag = 789456123
    viewContainer.isUserInteractionEnabled = false

    let viewBackgroundLoading: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    viewBackgroundLoading.center = viewContainer.center
    viewBackgroundLoading.backgroundColor = UIColor.white
    viewBackgroundLoading.clipsToBounds = true
    viewBackgroundLoading.layer.cornerRadius = 15
    viewContainer.addShadow()

    let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
    activityIndicatorView.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
    activityIndicatorView.style = UIActivityIndicatorView.Style.large
    activityIndicatorView.color = UIColor.blue
    activityIndicatorView.center = CGPoint(x: viewBackgroundLoading.frame.size.width / 2, y: viewBackgroundLoading.frame.size.height / 2)
    if startAnimate! {
        viewBackgroundLoading.addSubview(activityIndicatorView)
        mainContainer.addSubview(viewBackgroundLoading)
        viewContainer.addSubview(mainContainer)
        activityIndicatorView.startAnimating()
    } else {
        for subview in viewContainer.subviews {
            if subview.tag == 789456123 {
                subview.removeFromSuperview()
            }
        }
        viewContainer.isUserInteractionEnabled = true
    }
    return activityIndicatorView
}
