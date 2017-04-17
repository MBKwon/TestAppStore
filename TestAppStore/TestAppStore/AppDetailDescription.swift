//
//  AppDetailDescription.swift
//  TestAppStore
//
//  Created by Moonbeom KWON on 2017. 4. 17..
//  Copyright © 2017년 Kyle. All rights reserved.
//

import Foundation
import UIKit


class AppDetailDescription: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setInfo(itemInfo: AppDetailModel?) {
        descriptionLabel.text = itemInfo?.description
    }
}
