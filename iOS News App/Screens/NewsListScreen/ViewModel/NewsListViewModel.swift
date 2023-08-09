//
//  NewsListViewModel.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 09/08/23.
//

import Foundation

class NewsListViewModel {

    var tableViewReloadClosure: VoidClosure?
    var apiErrorClosure: ErrorClosure?
    var rowsCount: Int {
        return newsList.count
    }

    var newsResponseModel: NewsListResponseModel? {
        didSet {
            if let newsListArray = newsResponseModel?.newArrayList {
                newsList = newsListArray
            }
        }
    }

    var newsList:[NewsDataModel] = [NewsDataModel]() {
        didSet {
            self.tableViewReloadClosure?()
        }
    }
    var apiWorker: ApiRequest = {
        ApiRequest()
    }()
    
    func getNewsList(of period: NewsTimeLinePeriod) {
        apiWorker.getNewsList(ofPeriod: period.rawValue) { [ weak self] isSuccess, newsListResponse, error in
            guard isSuccess else {
                self?.apiErrorClosure?(error)
                return
            }
            self?.newsResponseModel = newsListResponse
        }
    }
    
    func getCellData(of indexPath: IndexPath) -> NewsDataModel {
        newsList[indexPath.row]
    }
}
