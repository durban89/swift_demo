//
//  Tabbar2ViewController.swift
//  swift_demo
//
//  Created by durban.zhang on 2018/5/28.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

import UIKit

class Tabbar2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    var dataArr: [PersonStructModel]?
    var urlPath = "http://127.0.0.1/json_demo.php"
    var recvData = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Tabbar2"
        self.view.backgroundColor = UIColor.green
        
        let rect = self.view.bounds;
        tableView = UITableView(frame: rect, style: UITableViewStyle.plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        self.view.addSubview(tableView!)
        
        downloadDataWithSession()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (dataArr == nil) {
            return 0
        }
        
        return dataArr!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "tabbar cell Identifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifier)
        }
        
        let data = dataArr![indexPath.row]
        cell!.textLabel!.text = data.name
        
        return cell!
    }
    
    func downloadDataWithSession() {
        // 创建NSURL
        let url = URL(string: urlPath)
        
        // 创建请求
        let request = URLRequest(url: url!)
        
        // 下载任务
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if error != nil {
                print(error.debugDescription)
            }
            
            guard let data = data else { return }
            
            do {
                let personData = try JSONDecoder().decode([PersonStructModel].self, from: data)
                print(personData)
                
                DispatchQueue.main.async {
                    self.dataArr = personData
                    self.tableView!.reloadData()
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
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
