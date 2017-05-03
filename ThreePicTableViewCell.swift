//
//  ThreeTableViewCell.swift
//  2017Exercise
//
//  Created by 袁思曾 on 2017/5/2.
//  Copyright © 2017年 袁思曾. All rights reserved.
//

import UIKit

class ThreePicTableViewCell: UITableViewCell {

    @IBOutlet weak var avarterImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var picOneImageView: UIImageView!
    
    @IBOutlet weak var picTwoImageView: UIImageView!
    
    @IBOutlet weak var picThreeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
