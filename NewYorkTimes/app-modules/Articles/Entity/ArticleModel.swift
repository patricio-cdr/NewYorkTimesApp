//
//  ArticleModel.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 16/02/24.
//

import Foundation

struct ArticleEntity: Codable {
    let status: String
    let copyright: String
    let numResults: Int
    let results: [ArticleResult]
    
    private enum CodingKeys: String, CodingKey {
        case status, copyright, numResults = "num_results", results
    }
}

struct ArticleResult: Codable {
    let uri: String
    let url: String
    let id: Int
    let assetId: Int
    let source: String
    let publishedDate: String
    let updated: String
    let section: String
    let subsection: String?
    let nytdsection: String
    let adxKeywords: String
    let column: String?
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let desFacet: [String]
    let orgFacet: [String]
    let perFacet: [String]
    let geoFacet: [String]
    let media: [Media]
    let etaId: Int
    
    private enum CodingKeys: String, CodingKey {
        case uri, url, id, assetId = "asset_id", source, publishedDate = "published_date", updated, section, subsection, nytdsection, adxKeywords = "adx_keywords", column, byline, type, title, abstract, desFacet = "des_facet", orgFacet = "org_facet", perFacet = "per_facet", geoFacet = "geo_facet", media, etaId = "eta_id"
    }
}

struct Media: Codable {
    let type: String
    let subtype: String?
    let caption: String?
    let copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadata]
    
    private enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}
