//
//  HomeNewsListViewController+Stub.swift
//  iOS News AppTests
//
//  Created by Rizwan Nasar on 09/08/23.
//

@testable import iOS_News_App
import UIKit
import Foundation

extension HomeNewsListViewController {
    static func stub() -> HomeNewsListViewController? {
        let newsListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeNewsListViewController") as? HomeNewsListViewController
        newsListViewController?.simulateView(navigationController: MockNavigationController())
        return newsListViewController
    }
}


class MockNavigationController: UINavigationController {
    
    convenience init() {
        self.init(rootViewController: UIViewController())
        
    }
    
    override init (rootViewController: UIViewController) {
        super.init(rootViewController: UIViewController())
        self.viewControllers = [rootViewController]
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
    }
}
