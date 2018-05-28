//
//  FontSizeChangeDelegate.swift
//  swift_demo
//
//  Created by durban.zhang on 2018/5/28.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

import Foundation

protocol FontSizeChangeDelegate: NSObjectProtocol {
    func fontSizeDidChange(controller: SecondViewController, fontSize: Int)
}
