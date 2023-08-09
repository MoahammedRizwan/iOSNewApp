//
//  NewsDetailsScreenVC+Stub.swift
//  iOS News AppTests
//
//  Created by Rizwan Nasar on 10/08/23.
//

@testable import iOS_News_App
import UIKit
import Foundation

extension NewsDetailsScreenVC {
    static func stub() -> NewsDetailsScreenVC? {
        let newsDetailsScreenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsDetailsScreenVC") as? NewsDetailsScreenVC
        newsDetailsScreenVC?.simulateView(navigationController: MockNavigationController())
        return newsDetailsScreenVC
    }
}
