//
//  ViewController.swift
//  swift_demo
//
//  Created by durban.zhang on 2018/5/27.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var clickCount:Int = 0
    var label: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        
        // UILabel
        var rect = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 44)
        label = UILabel(frame: rect)
        label!.text = "Label"
        label!.backgroundColor = UIColor.red
        
        // UIButton
        rect = CGRect(x: 0, y: label!.bounds.origin.y + 20 + 44, width: UIScreen.main.bounds.width, height: 44)
        let button = UIButton(frame: rect)
        button.backgroundColor = UIColor.blue
        button.setTitle("Click me", for: UIControlState.normal)
        button.addTarget(self, action: #selector(self.clickHandle(sender:)), for: UIControlEvents.touchUpInside)

        self.view.addSubview(label!)
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func clickHandle(sender: UIButton) {
        clickCount += 1
        print("I am clicked \(clickCount) times!")
        label!.text = "UIButton is clicked \(clickCount) times";
    }

}

