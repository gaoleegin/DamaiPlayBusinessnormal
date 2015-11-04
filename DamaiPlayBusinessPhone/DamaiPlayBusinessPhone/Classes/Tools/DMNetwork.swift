//
//  DMNetWork.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/10/28.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class DMNetwork: NSObject {
    
    class func requestJSON(method:Alamofire.Method,
        _ URLString: URLStringConvertible,
        parameters: [String: AnyObject]? = nil,
        completion:(JSON: AnyObject?)->()){
            
            //添加辅助参数
            var mutaParams: [String: AnyObject] = ["platform":1,"source":10000,"version":10100]
            
            for (key,value) in parameters! {
                mutaParams[key] = value
            }
            
            Alamofire.request(method, URLString, parameters: mutaParams).responseJSON { (Response) in
                if Response.result.isSuccess == false || Response.result.error != nil || Response.result.value == nil{
                    SVProgressHUD.showInfoWithStatus("数据出错")
                }else{
                    completion(JSON: Response.result.value)
                }
                print(Response.debugDescription)
                
            }
    }
}


