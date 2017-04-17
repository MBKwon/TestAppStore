//
//  AppDetailModel.swift
//  TestAppStore
//
//  Created by Moonbeom KWON on 2017. 4. 17..
//  Copyright © 2017년 Kyle. All rights reserved.
//

import Foundation
import ObjectMapper

struct AppDetailResults : Mappable {
    
    var resultCount: String?
    var results: [AppDetailModel]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        resultCount <- map["resultCount"]
        results     <- map["results"]
    }
}

struct AppDetailModel : Mappable {
    
    var artworkUrl100: String?
    var screenshotUrls: [String]?
    var averageUserRatingForCurrentVersion: Double?
    var trackCensoredName: String?
    var userRatingCountForCurrentVersion: Int?
    var description: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        artworkUrl100                       <- map["artworkUrl100"]
        screenshotUrls                      <- map["screenshotUrls"]
        averageUserRatingForCurrentVersion  <- map["averageUserRatingForCurrentVersion"]
        trackCensoredName                   <- map["trackCensoredName"]
        userRatingCountForCurrentVersion    <- map["userRatingCountForCurrentVersion"]
        description                         <- map["description"]
    }
}
