//
//  ApiRequests.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 09/08/23.
//

import Foundation
import Alamofire

// MARK:- Typealias
typealias CompletionDecodableResponse = ((Bool, NewsListResponseModel?, Error?) -> Void)
typealias VoidClosure = (() -> Void)
typealias ErrorClosure = ((Error?) -> Void)

class ApiRequest {
    
    init() {}
    
    func getNewsList(ofPeriod: Int = 7, completionHandler: @escaping(CompletionDecodableResponse)) {
        AF.request(APPUrls.mostViewedUrl(ofPeriod).requestUrl).responseDecodable(of: NewsListResponseModel.self) { apiResponse in
            switch apiResponse.result {
            case .success(let newsList):
                completionHandler(true, newsList, nil)
            case .failure(let error):
                completionHandler(false, nil, error.underlyingError)
            }
        }
    }
}
