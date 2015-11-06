//
//  DMActiveListViewController.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/11/4.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import SVProgressHUD


class DMActiveListViewController: UITableViewController {
    
    ///设置
    @IBAction func settingBtnClicked(sender: AnyObject) {
    
        let settingVC = DMSettingViewController()
        navigationController?.pushViewController(settingVC, animated: true)
        
    }
    
    private var avtivityList:[DMActiveModel]?
    
    private var introduction:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ///加载数据
        self.loadData()
        
    }
    
    ///加载列表数据
    func loadData(){
        
       SVProgressHUD.show()
        
       DMActiveModel.loadActiveList(1, pageSize: 10) { (acitiviList, being) -> () in
            self.avtivityList = acitiviList
        
        self.introduction = "\(being.abeing)个进行中的活动" + " | " + "\(being.allDone)个已结束的活动"
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }

    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = NSBundle.mainBundle().loadNibNamed("ActiveHeader", owner: self, options: nil).last as! DMActiveHeaderView
        
        let user  = DMUser.getUser()
        
        headerView.userName.text = user.name
        headerView.userImage.sd_setImageWithURL(NSURL(string: user.avatar))
        headerView.introductionLabel.text = introduction
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
        
        return cell
    }
    
}
