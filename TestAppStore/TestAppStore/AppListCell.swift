//
//  AppListCell.swift
//  TestAppStore
//
//  Created by Moonbeom KWON on 2017. 4. 17..
//  Copyright © 2017년 Kyle. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


class AppListCell: UITableViewCell {
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var appImageView: UIImageView!
    
    var iconUrl: String = ""
    
    func setInfo(_ itemInfo: AppListModel?, rank: Int) {
        numLabel.text = "\(rank)"
        
        guard let appInfoModel = itemInfo else  {
            return
        }
        
        titleLabel.text = appInfoModel.title
        if let iconUrl = appInfoModel.iconUrl {
            
            self.iconUrl = iconUrl
            appImageView.sd_setImage(with: URL(string: iconUrl), completed: { [unowned self] (iconImage, error, cacheType, url) in
                if self.iconUrl == url?.absoluteString {
                    self.appImageView.image = iconImage
                    
                } else {
                    self.appImageView.image = nil
                }
            })
        }
        
    }
}


extension AppListCell {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        appImageView.layer.masksToBounds = true
        appImageView.layer.borderWidth = 1/UIScreen.main.scale
        appImageView.layer.borderColor = UIColor(white: 0.7, alpha: 1.0).cgColor
        appImageView.layer.cornerRadius = appImageView.frame.size.width*0.2
    }
}
