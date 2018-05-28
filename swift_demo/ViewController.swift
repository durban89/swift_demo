//
//  ViewController.swift
//  swift_demo
//
//  Created by durban.zhang on 2018/5/27.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FontSizeChangeDelegate {
    var clickCount:Int = 0
    var label: UILabel?
    var textLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 导航控制
        self.title = "Navigation"
        let rightItem = UIBarButtonItem(title: "Next Page", style: .plain, target: self, action: #selector(self.nextPage))
        self.navigationItem.rightBarButtonItem = rightItem
        
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        
        // UILabel
        var rect = CGRect(x: 0, y: 70, width: UIScreen.main.bounds.width, height: 44)
        label = UILabel(frame: rect)
        label!.text = "Label"
        label!.backgroundColor = UIColor.red
        
        // UIButton
        rect = CGRect(x: 0, y: rect.origin.y + 44, width: UIScreen.main.bounds.width, height: 44)
        let button = UIButton(frame: rect)
        button.backgroundColor = UIColor.blue
        button.setTitle("Click me", for: UIControlState.normal)
        button.addTarget(self, action: #selector(self.clickHandle(sender:)), for: UIControlEvents.touchUpInside)
        
        print(rect)
        // UILabel
        rect = CGRect(x: 0, y: rect.origin.y + 44, width: UIScreen.main.bounds.width, height: 44)
        print(rect)
        textLabel = UILabel(frame: rect)
        textLabel!.text = "会变大的字体"
        textLabel!.backgroundColor = UIColor.brown
        
        self.view.addSubview(label!)
        self.view.addSubview(button)
        self.view.addSubview(textLabel!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fontSizeDidChange(controller: SecondViewController, fontSize: Int) {
        print("controller \(controller), fontSize \(fontSize)")
        textLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
    }
    
    @objc func clickHandle(sender: UIButton) {
        clickCount += 1
        print("I am clicked \(clickCount) times!")
        label!.text = "UIButton is clicked \(clickCount) times";
    }
    
    @objc func nextPage() {
        print("Next Page")
        
        let secondViewController = SecondViewController()
        secondViewController.delegate = self
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }

}

