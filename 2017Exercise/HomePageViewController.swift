//
//  ViewController.swift
//  2017Exercise
//
//  Created by 袁思曾 on 2017/4/27.
//  Copyright © 2017年 袁思曾. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    
    var width:CGFloat!
    var images:Array<UIImage> = []
    var collectionView:UICollectionView!
    var maskView:UIView!
    var cellRect:CGRect!
    var changeRect:CGRect!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func waterfallCollectionView(){
        width = (view.bounds.size.width - 20)/3
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

