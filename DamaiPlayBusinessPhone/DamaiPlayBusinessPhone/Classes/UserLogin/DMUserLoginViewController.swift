//
//  DMUserLoginViewController.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/11/3.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import SVProgressHUD

class DMUserLoginViewController: UIViewController {
    
    //版本
    @IBOutlet weak var VersionLabel: UILabel!
    
    //用户名
    @IBOutlet weak var UserName: UITextField!
    
    //密码
    @IBOutlet weak var PassWord: UITextField!
    
    ///登录
    @IBAction func userLogin() {
        
        
        let userNameString = UserName.text!;
        let passwordString = PassWord.text!;
        
        if(userNameString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)==0){
            SVProgressHUD.showInfoWithStatus("用户名不能为空")
            return
        }
        
        if(passwordString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)==0){
            SVProgressHUD.showInfoWithStatus("密码不能为空")
            return
        }
        
        ///加载用户的数据
        DMUser.loadUserData(userNameString, password: passwordString) { (user) -> () in
            ///完成加载用户信息的调用，进行控制器的跳转
            
            
            
        }
        
        
    }
        
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
