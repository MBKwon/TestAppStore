//
//  AppDetailTitle.swift
//  TestAppStore
//
//  Created by Moonbeom KWON on 2017. 4. 17..
//  Copyright © 2017년 Kyle. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import Cosmos


class AppDetailTitle: UITableViewCell {
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starRating: CosmosView!
    
    func setInfo(itemInfo: AppDetailModel?) {
        
        guard let appInfoModel = itemInfo else  {
            return
        }
        
        if let iconUrl = appInfoModel.artworkUrl100 {
            appImageView.sd_setImage(with: URL(string: iconUrl))
        }
        
        titleLabel.text = appInfoModel.trackCensoredName
        starRating.rating = appInfoModel.averageUserRatingForCurrentVersion ?? 0.0
        starRating.text = "(" + String(appInfoModel.userRatingCountForCurrentVersion ?? 0) + ")"
        starRating.alpha = 1.0
    }
}


extension AppDetailTitle {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        appImageView.layer.masksToBounds = true
        appImageView.layer.borderWidth = 1/UIScreen.main.scale
        appImageView.layer.borderColor = UIColor(white: 0.7, alpha: 1.0).cgColor
        appImageView.layer.cornerRadius = appImageView.frame.size.width*0.2
        
        starRating.settings.fillMode = .precise
    }
}
