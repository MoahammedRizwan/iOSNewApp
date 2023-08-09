//
//  UIViewController+Extension.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 09/08/23.
//

import Foundation
import UIKit

extension  UIViewController {

    func simulateView(navigationController: UINavigationController = UINavigationController()) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        
        navigationController.viewControllers = [self]
        window.rootViewController = navigationController
        
        _ = self.view
        self.beginAppearanceTransition(true, animated: true)
        self.endAppearanceTransition()
        
    }

    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
