//
//  DMActiveListTableViewCell.swift
//  DamaiPlayBusinessPhone
//
//  Created by 高李军 on 15/11/5.
//  Copyright © 2015年 DamaiPlayBusinessPhone. All rights reserved.
//

import UIKit
import SDWebImage

class DMActiveListTableViewCell: UITableViewCell {

    @IBOutlet weak var projectImage: UIImageView!
    
    @IBOutlet weak var projectNameLabel: UILabel!
    

    @IBOutlet weak var projectTimeLabel: UILabel!
    
    
    @IBOutlet weak var projectStatusLabel: UILabel!
    
    var activitModel:DMActiveModel?{
        didSet {
            self.projectNameLabel.text = activitModel?.projectName
            self.projectTimeLabel.text = activitModel?.introduction
            self.projectImage.sd_setImageWithURL(activitModel?.imageUrl)
            
        
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.projectNameLabel.preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.size.width - 120;
               
        self.projectTimeLabel.text = "今天就是我们的今天玩什么的局面色设置好不好"
        
    }
    
    

 

}
