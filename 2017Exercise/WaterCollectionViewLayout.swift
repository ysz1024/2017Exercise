//
//  WaterCollectionViewLayout.swift
//  2017Exercise
//
//  Created by 袁思曾 on 2017/4/27.
//  Copyright © 2017年 袁思曾. All rights reserved.
//

import UIKit

class WaterCollectionViewLayout: UICollectionViewLayout {
    
    //控制cell大小
    var setSize:()->(Array<UIImage>) = {_ in return []}
    var queueNum:Int = 2
    var hs:Array<CGFloat>!

}
