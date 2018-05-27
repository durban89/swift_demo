//
//  SecondViewController.swift
//  swift_demo
//
//  Created by durban.zhang on 2018/5/27.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Next Page"
        self.view.backgroundColor = UIColor.white
        
        
        // Do any additional setup after loading the view.
        
        // UIButton
        let rect = CGRect(x: 0, y: 70, width: UIScreen.main.bounds.width, height: 44)
        let button = UIButton(frame: rect)
        button.backgroundColor = UIColor.blue
        button.setTitle("Return Pre Page", for: UIControlState.normal)
        button.addTarget(self, action: #selector(self.returnClickHandle(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(button)
    }

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
    
    @objc func returnClickHandle(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
