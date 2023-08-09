//
//  AppUrls.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 09/08/23.
//

import Foundation

enum APPUrls {
    case mostViewedUrl(Int)
    
    var requestUrl: String {
        switch self {
        case .mostViewedUrl(let period):
            return String(format: AppConstant.baseUrl, period) + AppConstant.apiKey
        }
        
    }
}
