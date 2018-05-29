//
//  QWImageView.m
//  swift_demo
//
//  Created by durban.zhang on 2018/5/29.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

#import "QWImageView.h"

// 如果oc要调用swift里面的方法，需要包含这个固定的头文件
// 项目名称 #ProjectName#-Swift.h
#import <swift_demo-Swift.h>

@implementation QWImageView

- (void) addTarget: (id)target withSelector: (SEL)sel {
    _target = target;
    _sel = sel;
    self.userInteractionEnabled = YES;
    
    // 调用swift的方法
    SomeFunc *someFunc = [[SomeFunc alloc] init];
    [someFunc getSomeValue];
    
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_target) {
        [_target performSelector:_sel withObject:self];
    }
}

@end
