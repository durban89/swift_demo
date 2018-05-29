//
//  QWImageView.m
//  swift_demo
//
//  Created by durban.zhang on 2018/5/29.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

#import "QWImageView.h"

@implementation QWImageView

- (void) addTarget: (id)target withSelector: (SEL)sel {
    _target = target;
    _sel = sel;
    self.userInteractionEnabled = YES;
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_target) {
        [_target performSelector:_sel withObject:self];
    }
}

@end
