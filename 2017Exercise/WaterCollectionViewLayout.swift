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
    private var totalNum:Int!
    private var layoutAttributes:Array<UICollectionViewLayoutAttributes>!
    
    override func prepare() {
        super.prepare()
        hs = []
        for _ in 0..<queueNum{
            hs.append(5)
        }
        totalNum = collectionView?.numberOfItems(inSection: 0)
        layoutAttributes = []
        var indexpath:NSIndexPath!
        for index in 0..<totalNum{
            indexpath = NSIndexPath(row: index, section: 0)
            let attributes = layoutAttributesForItem(at: indexpath as IndexPath)
            layoutAttributes.append(attributes!)
        }
    }
    
    private let gap:CGFloat = 5//间隔
    private var width:CGFloat!
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        width = collectionView?.bounds.size.width - gap*
        
    }

}
