//
//  DMSettingCell.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/11/6.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class DMSettingCell: UITableViewCell {

    private var titleLabel:UILabel?
    
    private var lineView:UIView?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //添加控件
        titleLabel = UILabel()
        titleLabel?.textColor = UIColor.redColor()
        titleLabel?.font = UIFont.systemFontOfSize(10)
        titleLabel?.text = "系统设置"
        titleLabel?.backgroundColor = UIColor.blueColor()
        
        contentView.addSubview(titleLabel!)
        
        //定义一个约束的数组
        var cons = [NSLayoutConstraint]()
        
       cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[titleLabel(30)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["titleLabel":titleLabel!])
        
       cons += NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-[titleLabel(10)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["titleLabel":titleLabel!])
        
        
        contentView.addConstraints(cons)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    var cons = [AnyObject]()
    
    // 将生成的约束数组追加到临时数组中
    cons += NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[closeBtn(80)]-8-[saveBtn(80)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["closeBtn": closeBtn, "saveBtn": saveBtn])
    cons += NSLayoutConstraint.constraintsWithVisualFormat("V:[closeBtn]-20-|", options: NSLayoutFormatOptions(0), metrics: nil, views: ["closeBtn": closeBtn])
    
    /**
    任意一个控件，都可以参照另外一个控件，设置准确的位置属性
    
    参数
    1. 要设置约束的控件
    2. 约束属性
    3. 参照控件的关系
    4. 参照哪一个控件
    5. 被参照的约束属性
    6. 参照的乘积
    7. 约束数值
    */
    cons.append(NSLayoutConstraint(item: saveBtn, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: closeBtn, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0))
    
    // 2> 添加约束，自控件的约束，应该添加到父视图上
    view.addConstraints(cons)
    
    */
    
    
    
    

}
