//
//  HomepageViewController.swift
//  2017Exercise
//
//  Created by 袁思曾 on 2017/5/2.
//  Copyright © 2017年 袁思曾. All rights reserved.
//

import UIKit

class HomepageTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "New App"
        
        tableView.register(UINib.init(nibName: "OnePicTableViewCell", bundle: nil), forCellReuseIdentifier: "OnePicTableViewCell")
        tableView.register(UINib.init(nibName: "ThreePicTableViewCell", bundle: nil), forCellReuseIdentifier: "ThreePicTableViewCell")
        tableView.register(UINib.init(nibName: "BigPicTableViewCell", bundle: nil), forCellReuseIdentifier: "BigPicTableViewCell")

        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 24))
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 24))
        title.text = "  已当前位置为您排序"
        
        title.font = UIFont.systemFont(ofSize: 12)
        title.adjustsFontSizeToFitWidth = true
        //
        view.backgroundColor = UIColor.init(red: 200/255, green: 200/255, blue: 220/255, alpha: 0.8)
        //
        view.addSubview(title)
        
        
        return view
    }
    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "已当前位置为您排序"
    //
    //  }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24;
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cellOne = tableView.dequeueReusableCell(withIdentifier: "OnePicTableViewCell") as! OnePicTableViewCell
        let cellTwo = tableView.dequeueReusableCell(withIdentifier: "ThreePicTableViewCell") as! ThreePicTableViewCell
        let cellThree = tableView.dequeueReusableCell(withIdentifier: "BigPicTableViewCell") as! BigPicTableViewCell
        
        if indexPath.section == 0&&indexPath.row == 0{
            return cellOne
        }else if indexPath.section == 0&&indexPath.row == 1{
            return cellTwo
        }else{
            return cellThree
        }
        

    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        <#code#>
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
