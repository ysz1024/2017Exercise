//
//  OnePicTableViewCell.swift
//  2017Exercise
//
//  Created by 袁思曾 on 2017/5/2.
//  Copyright © 2017年 袁思曾. All rights reserved.
//

import UIKit

class OnePicTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avarterImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wishIcon: UIImageView!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var detailPic: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
