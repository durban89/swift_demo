//
//  SecondViewController.swift
//  swift_demo
//
//  Created by durban.zhang on 2018/5/27.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var fontSize: Int = 20
    var delegate: FontSizeChangeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Next Page"
        self.view.backgroundColor = UIColor.white
        
        
        // Do any additional setup after loading the view.
        
        // UIButton
        var rect = CGRect(x: 0, y: 70, width: UIScreen.main.bounds.width, height: 44)
        let button = UIButton(frame: rect)
        button.backgroundColor = UIColor.blue
        button.setTitle("Return Pre Page", for: UIControlState.normal)
        button.addTarget(self, action: #selector(self.returnClickHandle(sender:)), for: UIControlEvents.touchUpInside)
        
        // UIButton
        rect = CGRect(x: 0, y: rect.origin.y + 44, width: UIScreen.main.bounds.width, height: 44)
        let changeFontSizeButton = UIButton(frame: rect)
        changeFontSizeButton.setTitle("增加字体大小", for: UIControlState.normal)
        changeFontSizeButton.backgroundColor = UIColor.gray
        changeFontSizeButton.addTarget(self, action: #selector(self.changeFontSize), for: UIControlEvents.touchUpInside)
        
        // UIImage UIImageView
        rect = CGRect(x: 0, y: rect.origin.y + 44, width: 100, height: 100)
        let img = UIImage(named: "demo-image.png")
        let imgView = QWImageView(frame: rect)
        imgView.image = img
        imgView.addTarget(self, with: #selector(self.imageClick(sender:)))
        imgView.backgroundColor = UIColor.yellow
        
        self.view.addSubview(button)
        self.view.addSubview(changeFontSizeButton)
        self.view.addSubview(imgView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func imageClick(sender: QWImageView) {
        print("Click ImageView")
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
    
    @objc func changeFontSize() {
        fontSize += 1
        print("增加字体大小 \(fontSize)")
        
        if ((delegate) != nil) {
            delegate!.fontSizeDidChange(controller: self, fontSize: fontSize)
        }
    }
}
