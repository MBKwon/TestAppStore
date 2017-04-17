//
//  ViewController.swift
//  TestAppStore
//
//  Created by Moonbeom Kyle KWON on 2017. 4. 16..
//  Copyright © 2017년 Kyle. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let CELL_ID_APP_LIST        = "AppListCell"
    let SEGUE_ID_GO_TO_DETAIL   = "goToAppDetail"
    
    var selectedIndex: Int = -1
    var listModel: [AppListModel]?
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setNavigation(title: "Top 50")
        
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.registerNibName(identifer: CELL_ID_APP_LIST)
        
        APIController.sharedInstance.getAppListFromAppStore(callback: { listModel in
            self.listModel = listModel
            self.tableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_ID_GO_TO_DETAIL {
            if let viewController = segue.destination as? AppDetailViewCotroller {
                viewController.appId = listModel?[selectedIndex].appIdentifier ?? ""
            }
        }
    }
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID_APP_LIST) as! AppListCell
        cell.setInfo(itemInfo: listModel?[indexPath.row], rank: indexPath.row+1)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(false, animated: true)
        
        selectedIndex = indexPath.row
        performSegue(withIdentifier: SEGUE_ID_GO_TO_DETAIL, sender: self)
    }
}

