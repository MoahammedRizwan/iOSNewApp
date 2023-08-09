//
//  NewsListViewModelTests.swift
//  iOS News AppTests
//
//  Created by Rizwan Nasar on 09/08/23.
//

import Foundation
import Quick
import Nimble

@testable import iOS_News_App

class NewsListViewModelTests: QuickSpec {
    var viewModel: NewsListViewModel!
    var initialModel: NewsDataModel!

    override func spec() {
        describe("NewsListViewModelTests Tests") {
            context("when called from view controller") {
                beforeEach {
                    self.viewModel = NewsListViewModel()
                    self.viewModel.getNewsList(of: .weekly)
                    self.viewModel.newsResponseModel = ApiMock.getMockNewsResponse()
                    self.initialModel = self.viewModel.getCellData(of: IndexPath(row: 0, section: 0))
                }
                
                it("Data of rows count") {
                    expect(self.viewModel.rowsCount) == 20
                }
                
                it("validate of first row content") {
                    
                    expect(self.initialModel.title) == self.viewModel.newsList.first?.title
                }
            }
        }
    }
}
