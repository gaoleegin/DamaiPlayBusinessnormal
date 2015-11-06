//
//  DMSettingViewController.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/11/6.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class DMSettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置导航条
        self.setUpNavBar()
        
        //给tableview添加footerview
        self.addFooterView()
    }
    
    //给table添加footerview
    private func addFooterView(){
        
        tableView.backgroundColor = UIColor.colorWithHex("f2f2f2")
        
        
        let footerView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 75))
        
        footerView.backgroundColor = UIColor.colorWithHex("f2f2f2")
        
        
        let exitBtn = UIButton()
        exitBtn.setTitle("退出登录", forState: UIControlState.Normal)
        exitBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        exitBtn.backgroundColor = UIColor.redColor()
        exitBtn.layer.cornerRadius = 15
        exitBtn.clipsToBounds = true
        
        exitBtn.addTarget(self, action: "exit", forControlEvents: UIControlEvents.TouchUpInside)
        
        let exitBtnX:CGFloat = 50
        let exitBtnY:CGFloat = 35
        let exitBtnH:CGFloat = 30
        let exitBtnW:CGFloat = UIScreen.mainScreen().bounds.size.width-exitBtnX * 2
        
        exitBtn.frame = CGRectMake(exitBtnX, exitBtnY, exitBtnW, exitBtnH)
        footerView.addSubview(exitBtn)
        
        tableView.tableFooterView = footerView
        
    }
    
    ///退出系统
    func exit(){
        
        let loginsb = UIStoryboard(name: "UserLogin", bundle: nil)
        let logingVC = loginsb.instantiateInitialViewController() as! DMUserLoginViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = logingVC
    }
    
    ///设置导航条
    private func setUpNavBar(){
        
        title = "系统设置"
        //设置返回按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "manage_back"), style: UIBarButtonItemStyle.Plain, target: self, action: "leftBtnClicked")
    }
    
    func leftBtnClicked(){
        navigationController?.popViewControllerAnimated(true)
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
        return 2
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = DMSettingCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellSetting")
        
        if (indexPath.row==0){
            cell.titleLabel?.text = "意见反馈"
        } else{
            cell.titleLabel?.text = "关于我们"
        }

        return cell
    }

}
