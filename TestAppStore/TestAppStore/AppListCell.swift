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
    
    func setInfo(itemInfo: AppListModel?, rank: Int) {
        numLabel.text = String(rank)
        
        guard let appInfoModel = itemInfo else  {
            return
        }
        
        titleLabel.text = appInfoModel.title
        
        if let iconUrl = appInfoModel.iconUrl {
            appImageView.sd_setImage(with: URL(string: iconUrl))
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
