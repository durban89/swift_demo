//
//  TabBarViewController.swift
//  swift_demo
//
//  Created by durban.zhang on 2018/5/28.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.title = "Tabbar"
        
        let tabbar1: UIViewController = Tabbar1ViewController()
        let tabbar1Nav = UINavigationController(rootViewController: tabbar1)
        tabbar1Nav.tabBarItem = UITabBarItem(title: "Tarbar1", image: nil, tag: 1)
        
        let tabbar2: UIViewController = Tabbar2ViewController()
        let tabbar2Nav = UINavigationController(rootViewController: tabbar2)
        tabbar2Nav.tabBarItem = UITabBarItem(title: "Tarbar2", image: nil, tag: 2)
        
        let tabbar3: UIViewController = Tabbar3ViewController()
        let tabbar3Nav = UINavigationController(rootViewController: tabbar3)
        tabbar3Nav.tabBarItem = UITabBarItem(title: "Tarbar3", image: nil, tag: 3)
        
        let tabbarArr = [tabbar1Nav, tabbar2Nav, tabbar3Nav]
        self.viewControllers = tabbarArr
        
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

}
