//
//  SomeFunc.swift
//  swift_demo
//
//  Created by durban.zhang on 2018/5/29.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

import UIKit

class SomeFunc: NSObject {
    override init() {
        print("SomeFunc init")
    }
    
    @objc func getSomeValue() {
        print("get some value")
    }
}
