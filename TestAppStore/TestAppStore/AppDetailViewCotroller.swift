//
//  AppDetailViewCotroller.swift
//  TestAppStore
//
//  Created by Moonbeom KWON on 2017. 4. 17..
//  Copyright © 2017년 Kyle. All rights reserved.
//

import Foundation
import UIKit


class AppDetailViewCotroller: UIViewController {
    
    let CELL_ID_APP_DETAIL_TITLE        = "AppDetailTitle"
    let CELL_ID_APP_DETAIL_IMAGES       = "AppScreanImages"
    let CELL_ID_APP_DETAIL_DESCRIPTION  = "AppDetailDescription"
    
    @IBOutlet weak var tableView: UITableView!
    var appDetailModel: AppDetailModel?
    
    var appId: String {
        get {
            return self.appId
        }
        
        set (newAppId) {
            APIController.sharedInstance.getAppInfo(appId: newAppId, callback: { detailModel in
                self.appDetailModel = detailModel
                
                self.setNavigation(title: self.appDetailModel?.appTitle)
                self.tableView.reloadData()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.estimatedRowHeight = 102.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.registerNibName(identifer: CELL_ID_APP_DETAIL_TITLE)
        tableView.registerNibName(identifer: CELL_ID_APP_DETAIL_IMAGES)
        tableView.registerNibName(identifer: CELL_ID_APP_DETAIL_DESCRIPTION)
    }
}


extension AppDetailViewCotroller: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID_APP_DETAIL_TITLE) as! AppDetailTitle
            cell.setInfo(itemInfo: appDetailModel)
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID_APP_DETAIL_IMAGES) as! AppScreanImages
            cell.superViewController = self
            cell.setInfo(itemInfo: appDetailModel)
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID_APP_DETAIL_DESCRIPTION) as! AppDetailDescription
            cell.setInfo(itemInfo: appDetailModel)
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}
