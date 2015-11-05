//
//  DMActiveModel.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/11/5.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import SVProgressHUD

class DMActiveModel: NSObject {
    
    
    var activityInfoDto: [String:AnyObject]?{
        didSet {
            for (key,value) in activityInfoDto!{
                if key == "img" {
                    imageUrl = NSURL(string: value as! String)
                }
            }
        }
    }
    
    var auditStatus:Int?
    
    var projectName:String?
    
    var projectId:Int?
    
    var introduction:String?
    
    var imageUrl:NSURL?
    
    init(dict: [String:AnyObject]) {
        //activityInfoDto =
        auditStatus = dict["auditStatus"] as? Int
        projectName = dict["projectName"] as? String
        projectId = dict["projectId"] as? Int
        introduction = dict["introduction"] as? String

    }
    
    
    ///加载主办发布的项目列表
    class func loadActiveList(pageindex:Int,pageSize:Int,completion: (acitiviList:[DMActiveModel]?,(abeing:Int,allDone:Int))->()){
        
        //http://fb.jtwsm.cn/recount/GetRecountActivitys_show.do?m=8BACF7CA76D89F4B80F4CC43C867C281&pageIndex=1&pageSize=10&source=100001&version=10100
        
        let urlString = "http://fb.jtwsm.cn/recount/GetRecountActivitys_show.do"
        
        let parameters = ["pageIndex":pageindex,"pageSize":pageSize,"m":DMMValueAndVValue.getMVValue()]
        
        DMNetwork.requestJSON(.GET, urlString,parameters:parameters as? [String : AnyObject]) { (JSON) in
            
            print("返回的JSON数据\(JSON)")
            
            let dict =  JSON as! [String:AnyObject]
            if let errCode = dict["errorCode"]{
                if errCode as! Int != 0 {
                    SVProgressHUD.showInfoWithStatus(dict["error"] as! String)
                    return
                } else{
                    
                    
                    let obj = dict["obj"] as! [String:AnyObject]
                    
                    //数据列表
                    let recountActivitysList = obj["recountActivitysList"] as! [String:AnyObject]
                    
                    //已经结束的活动
                    let endedActCount = recountActivitysList["endedActCount"] as! Int
                    
                    //进行中的活动
                    let startingActCount  = recountActivitysList["startingActCount"] as! Int
                    
                    //所有的数据列表的数组
                    let activityInfoArray:[[String:AnyObject]] = recountActivitysList["activityInfos"] as! [[String:AnyObject]]
                    
                    //返回去的数据的列表,一定要给这个数组分配内存空间
                    var activityInfoReturnArray:[DMActiveModel]?  = [DMActiveModel]()
                    
                    for dict in activityInfoArray{
                        let activityinfo = DMActiveModel(dict: dict)
                        
                        activityinfo.activityInfoDto = dict["activityInfoDto"] as? [String: AnyObject]
                        
                        activityInfoReturnArray?.append(activityinfo)
                    }
                    
                    completion(acitiviList: activityInfoReturnArray, (endedActCount,startingActCount))
                    
                }
            }
            
        }
        
    }
    
}
