//
//  Tabbar1ViewController.swift
//  swift_demo
//
//  Created by durban.zhang on 2018/5/28.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

import UIKit

class Tabbar1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSURLConnectionDataDelegate {
    
    var dataArr = NSMutableArray();
    var tableView: UITableView?;
    var urlPath = "http://127.0.0.1/json_demo.php"
    var recvData = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Tabbar1"
        self.view.backgroundColor = UIColor.blue
        
        let rect = self.view.bounds
        tableView = UITableView(frame: rect, style: UITableViewStyle.plain)
        tableView!.dataSource = self
        tableView!.delegate = self
        
        self.view.addSubview(tableView!)
        
        downloadData()
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
        
        let p = dataArr[indexPath.row] as! PersonModel
        let name: String = p.name!
        cell?.textLabel?.text = name
        
        return cell!
    }
    
    func downloadData() {
        // 创建NSURL
        let url = URL(string: urlPath)
        
        // 创建请求
        let request = URLRequest(url: url!)
        
        // 创建连接
        NSURLConnection(request: request, delegate: self)
    }
    
    public func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        
    }
    
    public func connection(_ connection: NSURLConnection, didReceive data: Data) {
        recvData.append(data)
    }
    
    public func connectionDidFinishLoading(_ connection: NSURLConnection) {
//        let s = String(data: recvData as Data, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
        
        do {
            let personArr = try JSONSerialization.jsonObject(with: recvData, options: JSONSerialization.ReadingOptions.mutableLeaves) as! Array<Any>
            
            print("personArr is \(personArr)")
            
            for person in personArr {
                let p = person as! Dictionary<String, Any>
                
                let personModel = PersonModel()
                personModel.name = p["name"] as? String
                personModel.age = p["age"] as? Int
                
                dataArr.add(personModel)
                tableView?.reloadData()
            }
            
        } catch { }
        
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
