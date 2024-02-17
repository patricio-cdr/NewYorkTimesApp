//
//  ArticleModel.swift
//  NewYorkTimes
//
//  Created by Patricio Calderon on 16/02/24.
//

import Foundation

import ObjectMapper

struct ArticleEntity: Mappable {
    var status: String = ""
    var copyright: String = ""
    var numResults: Int = 0
    var results: [ArticleResult] = []

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        status <- map["status"]
        copyright <- map["copyright"]
        numResults <- map["num_results"]
        results <- map["results"]
    }
}

struct ArticleResult: Mappable {
    var uri: String = ""
    var url: String = ""
    var id: Int = 0
    var assetId: Int = 0
    var source: String = ""
    var publishedDate: String = ""
    var updated: String = ""
    var section: String = ""
    var subsection: String? = ""
    var nytdsection: String = ""
    var adxKeywords: String = ""
    var column: String? = ""
    var byline: String = ""
    var type: String = ""
    var title: String = ""
    var abstract: String = ""
    var desFacet: [String] = []
    var orgFacet: [String] = []
    var perFacet: [String] = []
    var geoFacet: [String] = []
    var media: [Media] = []
    var etaId: Int = 0

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        uri <- map["uri"]
        url <- map["url"]
        id <- map["id"]
        assetId <- map["asset_id"]
        source <- map["source"]
        publishedDate <- map["published_date"]
        updated <- map["updated"]
        section <- map["section"]
        subsection <- map["subsection"]
        nytdsection <- map["nytdsection"]
        adxKeywords <- map["adx_keywords"]
        column <- map["column"]
        byline <- map["byline"]
        type <- map["type"]
        title <- map["title"]
        abstract <- map["abstract"]
        desFacet <- map["des_facet"]
        orgFacet <- map["org_facet"]
        perFacet <- map["per_facet"]
        geoFacet <- map["geo_facet"]
        media <- map["media"]
        etaId <- map["eta_id"]
    }
}

struct Media: Mappable {
    var type: String = ""
    var subtype: String? = ""
    var caption: String? = ""
    var copyright: String = ""
    var approvedForSyndication: Int = 0
    var mediaMetadata: [MediaMetadata] = []

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        type <- map["type"]
        subtype <- map["subtype"]
        caption <- map["caption"]
        copyright <- map["copyright"]
        approvedForSyndication <- map["approved_for_syndication"]
        mediaMetadata <- map["media-metadata"]
    }
}

struct MediaMetadata: Mappable {
    var url: String = ""
    var format: String = ""
    var height: Int = 0
    var width: Int = 0

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        url <- map["url"]
        format <- map["format"]
        height <- map["height"]
        width <- map["width"]
    }
}
