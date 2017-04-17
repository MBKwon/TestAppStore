//
//  Extentions.swift
//  TestAppStore
//
//  Created by Moonbeom Kyle KWON on 2017. 4. 17..
//  Copyright © 2017년 Kyle. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setNavigation(title: String?) {
        self.navigationController?.navigationBar.topItem?.title = title
    }
}

extension UITableView {
    func registerNibName(identifer: String) {
        self.register(UINib(nibName: identifer, bundle: nil), forCellReuseIdentifier: identifer)
    }
}

