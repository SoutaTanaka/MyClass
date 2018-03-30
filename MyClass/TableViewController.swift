//
//  TableViewController.swift
//  MyClass
//
//  Created by 田中颯太 on 2018/03/29.
//  Copyright © 2018年 田中颯太. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    var profile: NSArray = ["プロフィール"]
    let setting: NSArray = ["アカウント", "履歴", "ヘルプ"]
    let logoutcell: NSArray = ["ログアウト"]
    
    let tableViewSection: NSArray = ["Profile", "設定", "ログアウト"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSection.count
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("section:\(section)")
        if section == 0{
            return profile.count
        }else if section == 1{
            return setting.count
        }else if section == 2{
            return logoutcell.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! CustomCell
        
        //        cell.nameLabel.text = "Hello"
        
        if indexPath.section == 0{
            cell.nameLabel.text = String(describing: profile[indexPath.row])
        }else if indexPath.section == 1{
            cell.nameLabel.text = String(describing: setting[indexPath.row])
        }else if indexPath.section == 2{
            
            cell.nameLabel.text = String(describing: logoutcell[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewSection[section] as? String
    }
    func tableView(_ table: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 80
        }else{
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0{
            
        }else if indexPath.section == 1{
            
        }else if indexPath.section == 2{
            logout()
        }
    }
    
    func logout(){
        do{
            try! Auth .auth().signOut()
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let nextView = storyboard.instantiateInitialViewController()
            present(nextView!, animated: true, completion: nil)
        }
    }
    
    
}
