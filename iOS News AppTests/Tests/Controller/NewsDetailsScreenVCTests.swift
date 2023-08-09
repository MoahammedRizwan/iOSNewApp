//
//  NewsDetailsScreenVCTests.swift
//  iOS News AppTests
//
//  Created by Rizwan Nasar on 09/08/23.
//

import Foundation
import Quick
import Nimble

@testable import iOS_News_App

class NewsDetailsScreenVCTests: QuickSpec {
    var newsDetailsScreenVC: NewsDetailsScreenVC!
    
    override func spec() {
        describe("NewsDetailsScreenVCTests Tests") {
            context("when initialized") {
                
                
                context("when view loaded for first time") {
                    beforeEach {
                        self.newsDetailsScreenVC = NewsDetailsScreenVC.stub()
                    }
                    
                    it("Should have all IBOutlets not nil") {
                        expect(self.newsDetailsScreenVC.thumbnailImage).toNot(beNil())
                        expect(self.newsDetailsScreenVC.headLineLabel).toNot(beNil())
                        expect(self.newsDetailsScreenVC.descriptionNewsLabel).toNot(beNil())
                        expect(self.newsDetailsScreenVC.postDateLabel).toNot(beNil())
                    }
                }
                
                
            }
        }
    }
}
