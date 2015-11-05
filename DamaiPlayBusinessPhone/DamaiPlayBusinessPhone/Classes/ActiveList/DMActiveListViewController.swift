//
//  DMActiveListViewController.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/11/4.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit


class DMActiveListViewController: UITableViewController {
    
    
    var user:DMUser?
    
    var avtivityList:[DMActiveModel]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ///加载数据
        self.loadData()
        
        ///设置头部信息
        self.setUpTableViewHeader()
        
    }
    
    
    private func setUpTableViewHeader(){
        
        
        
        
    }
    
    ///加载列表数据
    func loadData(){
        
       DMActiveModel.loadActiveList(1, pageSize: 10) { (acitiviList, being) -> () in
            self.avtivityList = acitiviList
            self.tableView.reloadData()
        }

    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = NSBundle.mainBundle().loadNibNamed("ActiveHeader", owner: self, options: nil).last as! UIView
        
        return headerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.avtivityList?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ActiveListcell", forIndexPath: indexPath) as! DMActiveListTableViewCell
        
        let model = self.avtivityList![indexPath.row]
        
        cell.activitModel = model
        
    print(model.imageUrl)
 
        return cell
    }
    
}
