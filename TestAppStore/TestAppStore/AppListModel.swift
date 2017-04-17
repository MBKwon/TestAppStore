//
//  AppListModel.swift
//  TestAppStore
//
//  Created by Moonbeom KWON on 2017. 4. 17..
//  Copyright © 2017년 Kyle. All rights reserved.
//

import Foundation
import ObjectMapper


struct AppListModel : Mappable {
    
    var title: String?
    var iconUrl: String?
    var appIdentifier: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        title           <- map["im:name.label"]
        iconUrl         <- map["im:image.1.label"]
        appIdentifier 	<- map["id.attributes.im:id"]
    }
}
