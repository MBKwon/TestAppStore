
//
//  APIController.swift
//  TestAppStore
//
//  Created by Moonbeom Kyle KWON on 2017. 4. 16..
//  Copyright © 2017년 Kyle. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper



class APIController {
    
    let APP_LIST_URL        = "https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json"
    let APP_INFO_TEMPALTE   = "https://itunes.apple.com/lookup?id={id}&country=kr"
    
    
    //MARK: Shared Instance
    private init() { }
    static let sharedInstance: APIController = APIController()
}

extension APIController {
    
    func getAppListFromAppStore(callback: @escaping ([AppListModel]?)->()) {
        Alamofire.request(APP_LIST_URL).responseArray(keyPath: "feed.entry") { (response: DataResponse<[AppListModel]>) in
            
            guard let listModel = response.result.value else {
                callback(nil)
                return
            }
            
            callback(listModel)
        }
        
    }
    
    
    func getAppInfo(appId: String, callback: @escaping (AppDetailModel?)->()) {
        let appInfoUrl: String = APP_INFO_TEMPALTE.replacingOccurrences(of: "{id}", with: appId)
        
        Alamofire.request(appInfoUrl).responseObject { (response: DataResponse<AppDetailResults>) in
            
            guard let detailResponse = response.result.value else {
                callback(nil)
                return
            }
            
            
            guard let appDetailResults = detailResponse.results else {
                callback(nil)
                return
            }
            
            
            callback(appDetailResults.first)
        }
    }
    
}
