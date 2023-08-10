//
//  HomeNewsListViewControllerTests.swift
//  iOS News AppTests
//
//  Created by Rizwan Nasar on 09/08/23.
//

import Foundation
import Quick
import Nimble

@testable import iOS_News_App

class HomeNewsListViewControllerTests: QuickSpec {
    var homeNewsListViewController: HomeNewsListViewController!
    var navigationController: MockNavigationController!

    override func spec() {
        describe("HomeNewsListViewController Tests") {
            context("when initialized") {
                beforeEach {
                    self.homeNewsListViewController = HomeNewsListViewController.stub()
                }
                
                context("when view loaded for first time") {
                    it("Should have all IBOutlets nil") {
                        expect(self.homeNewsListViewController.newsListTable).notTo(beNil())
                        expect(self.homeNewsListViewController.segmentController).notTo(beNil())
                    }
                    it("Should Tableview Data Source and Delegates") {
                        expect(self.homeNewsListViewController.newsListTable.dataSource?.conforms(to: UITableViewDataSource.self)).to(beTrue())
                        expect(self.homeNewsListViewController.newsListTable.dataSource?.conforms(to: UITableViewDelegate.self)).to(beTrue())
                    }
                }
                
                context("when got response") {
                    beforeEach {
                        self.homeNewsListViewController.viewModel.newsResponseModel = ApiMock.getMockNewsResponse()
                        self.homeNewsListViewController.period = .weekly
                        self.homeNewsListViewController.segmentController.selectedSegmentIndex = 2
                        self.homeNewsListViewController.segmentController.sendActions(for: .valueChanged)
                        self.homeNewsListViewController.didReceiveRemoteResponse()
                    }
                    
                    it("period should changed to monthly") {
                        expect(self.homeNewsListViewController.period) == NewsTimeLinePeriod.monthly
                    }
                    
                    it("should have viewmodel sync") {
                        expect(self.homeNewsListViewController.newsListTable.numberOfRows(inSection: 0)) == self.homeNewsListViewController.viewModel.rowsCount
                    }
                }
                
                context("Table view loaded") {
                    beforeEach {
                        self.navigationController = self.homeNewsListViewController.navigationController as? MockNavigationController
                        self.homeNewsListViewController.viewModel.newsResponseModel = ApiMock.getMockNewsResponse()
                    }
                    it("should load cells") {
                        expect(self.homeNewsListViewController.responds(to: #selector(self.homeNewsListViewController.tableView(_:cellForRowAt:)))).to(beTrue())
                    }
                    it("news tableview cell") {
                        expect((self.homeNewsListViewController.newsListTable.cellForRow(at: IndexPath(row: 0, section: 0)) as? NewsTableViewCell) != nil).toEventually(beTrue())
                    }
                }
                context("Table view selected") {
                    beforeEach {
                        self.navigationController = self.homeNewsListViewController.navigationController as? MockNavigationController
                        self.homeNewsListViewController.viewModel.newsResponseModel = ApiMock.getMockNewsResponse()
                        
                        self.homeNewsListViewController.tableView(self.homeNewsListViewController.newsListTable, didSelectRowAt: IndexPath.init(row: 0, section: 0))
                    }
                    
                    it("should navigate to detail screen") {
                        expect(self.homeNewsListViewController.navigationController?.topViewController?.restorationIdentifier) == "HomeNewsListViewController"
                    }
                }
                
            }
        }
    }
}

class ApiMock {
    static func getMockNewsResponse() -> NewsListResponseModel? {
        Bundle.main.decode(NewsListResponseModel?.self, from: "getMostPopularNews.json")
    }
}
