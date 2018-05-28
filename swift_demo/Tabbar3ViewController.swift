//
//  Tabbar3ViewController.swift
//  swift_demo
//
//  Created by durban.zhang on 2018/5/28.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

import UIKit

class Tabbar3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var dataArr = NSMutableArray()
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Tabbar3"
        self.view.backgroundColor = UIColor.yellow
        
        // 初始化数据源
        for i in (0...100) {
            dataArr.add("row \(i)")
        }
        
        let rect = self.view.bounds;
        tableView = UITableView(frame: rect, style: UITableViewStyle.plain)
        tableView!.dataSource = self
        tableView!.delegate = self
        self.view.addSubview(tableView!)
        
        print(dataArr)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifier)
        }
        
        let s = dataArr.object(at: indexPath.row) as? String
        cell?.textLabel?.text = s
        return cell!
    }
    
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row \(indexPath.row) selected")
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
