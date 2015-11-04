//
//  DMMValueAndVValue.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/11/4.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import SVProgressHUD

class DMMValueAndVValue: NSObject,NSCoding {
    
    var MValue:String
    var VValue:String
    
    ///缓存路径
    static let MVValuePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last?.stringByAppendingString("/MVValue.plist")
    
    
    init(dict:[String:AnyObject]) {
        MValue = dict["M"] as! String
        VValue = dict["V"] as! String
    }
    
    ///归档
    required init(coder aDecoder: NSCoder) {
        
        MValue = aDecoder.decodeObjectForKey("M")as! String
        VValue = aDecoder.decodeObjectForKey("V")as! String
    }
    
    
    class func loadMVValue(username:String,password:String,completion:(DMValue: DMMValueAndVValue?)->()) {
        
        let urlString =  "http://wanapi.damai.cn/user/loginforticket.json"
        
        let params = ["passwd":password,"phone":username]
        
        DMNetwork.requestJSON(.GET, urlString, parameters: params) { (JSON) in
            let dict =  JSON as! [String:AnyObject]
            if let errCode = dict["errorCode"]{
                if errCode as! Int != 0 {
                    SVProgressHUD.showInfoWithStatus(dict["error"] as! String)
                    return
                } else{
                    let MVVauleDict = dict["data"] as! [String:AnyObject]
                    
                    let MVValue = DMMValueAndVValue(dict: MVVauleDict)
                    
                    self.storeMVValue(MVValue)
                    
                    
                    
                    
                    completion(DMValue: MVValue)
                }
            }
        }

    }
    
    
    
    /// 存档
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(MValue, forKey: "M")
        aCoder.encodeObject(VValue, forKey: "V")
    }
    
    /// 获取M值
    class func getMVValue()->(String){
        
        let DMMValue = NSKeyedUnarchiver.unarchiveObjectWithFile(MVValuePath!) as! DMMValueAndVValue
        
        return(DMMValue.MValue)
    }
    
    ///获取V值
    class func getVValue()->(String) {
        let DMMValue = NSKeyedUnarchiver.unarchiveObjectWithFile(MVValuePath!) as! DMMValueAndVValue
        return(DMMValue.VValue)
        
    }
    
    ///写入缓存
    class func storeMVValue(MVValue:DMMValueAndVValue){
        
        NSKeyedArchiver.archiveRootObject(MVValue, toFile: MVValuePath!)
    }
}


