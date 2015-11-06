//
//  DMSettingCell.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/11/6.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit

class DMSettingCell: UITableViewCell {

     var titleLabel:UILabel?
    
    private var lineView:UIView?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //添加控件
        selectionStyle = UITableViewCellSelectionStyle.None
        titleLabel = UILabel()
        titleLabel?.textColor = UIColor.colorWithHex("514647")
        titleLabel?.font = UIFont.systemFontOfSize(15)
        
        titleLabel?.backgroundColor = UIColor.clearColor()
        contentView.addSubview(titleLabel!)
        
        
        
        titleLabel?.sizeToFit()
  
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let titleLabelX:CGFloat = 16
        
        let titleLabelH:CGFloat = 20
        
        let titleLabelW:CGFloat = 100
        
        let titleLabelY:CGFloat = (60-titleLabelH) * 0.5
        
        titleLabel?.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH)
        
        
        
        
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
