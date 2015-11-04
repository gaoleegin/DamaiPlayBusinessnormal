//
//  DMUser.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/11/4.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import SVProgressHUD

class DMUser: NSObject ,NSCoding{
    
    //用户头像
     var avatar:String!{
        didSet {
            avatarUrl = NSURL(string: avatar!)!
        }
    }
    
    var avatarUrl:NSURL?
    
    var isSponsor:Int
    
    //用户名
    var name:String
    
    /// 构造方法
   init(dict :[String:AnyObject]) {
        avatar = dict["avatar"] as! String
        isSponsor = dict["isSponsor"] as! Int
        name = dict["name"] as! String
    }
    
    /// 解档
    required init?(coder aDecoder: NSCoder) {
        avatarUrl = aDecoder.decodeObjectForKey("avatarUrl") as? NSURL
        isSponsor = aDecoder.decodeObjectForKey("isSponsor")as! Int
        name  = aDecoder.decodeObjectForKey("name")as! String
    }
    
    /// 存档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(avatarUrl, forKey: "avatarUrl")
        aCoder.encodeObject(isSponsor, forKey: "isSponsor")
        aCoder.encodeObject(name, forKey: "name")
    }
    
    ///加载用户的数据
    class func loadUserData(username:String,password:String,completion:(user:DMUser)->()) {
        //http://fb.jtwsm.cn/recount/GetUserInfoRest.do?m=8BACF7CA76D89F4B80F4CC43C867C281&source=100001&version=10100
        
        let urlString = "http://fb.jtwsm.cn/recount/GetUserInfoRest.do"
        
        DMMValueAndVValue.loadMVValue(username, password: password) { (DMValue) in
            let paramer = ["m":DMMValueAndVValue.getMVValue()]
            
            DMNetwork.requestJSON(.GET, urlString, parameters:paramer,completion: { (JSON) in
                
                let dict =  JSON as! [String:AnyObject]
                if let errCode = dict["errorCode"]{
                    if errCode as! Int != 0 {
                        SVProgressHUD.showInfoWithStatus(dict["error"] as! String)
                        return
                    } else{
                        
                        let userdict = dict["data"] as! [String:AnyObject]
                        let user = DMUser(dict: userdict)
                        
                        completion(user: user)
                    }
                }

            })
            
        }
        
    }
}
