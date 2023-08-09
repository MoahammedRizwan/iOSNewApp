//
//  NewsModel.swift
//  iOS News App
//
//  Created by Rizwan Nasar on 08/08/23.
//

import Foundation

// MARK: - NewsListResponseModel
struct NewsListResponseModel: Codable {
    let status, copyright: String?
    let totalResults: Int?
    let newArrayList: [NewsDataModel]?
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case totalResults = "num_results"
        case newArrayList = "results"
    }
}

// MARK: - NewsListArray
struct NewsDataModel: Codable {
    let uri, url, publishedDate, updated, section, subsection: String?
    let id, assetID: Int?
    let source: Source?
    let nytdsection, adxKeywords, byline, title, abstract: String?
    let type: ResultType?
    let desFacet, orgFacet, perFacet, geoFacet: [String]?
    let media: [Media]?
    let etaID: Int?
    
    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case  byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}

// MARK: - Media
struct Media: Codable {
    let type: MediaType?
    let subtype: Subtype?
    let caption, copyright: String?
    let approvedForSyndication: Int?
    let mediaMetadata: [MediaMetadatum]?
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
    let format: Format?
    let height, width: Int?
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}

enum Subtype: String, Codable {
    case empty = ""
    case photo = "photo"
}

enum MediaType: String, Codable {
    case image = "image"
}

enum Source: String, Codable {
    case newYorkTimes = "New York Times"
}

enum ResultType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
}
