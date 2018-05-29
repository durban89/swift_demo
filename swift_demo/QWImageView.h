//
//  QWImageView.h
//  swift_demo
//
//  Created by durban.zhang on 2018/5/29.
//  Copyright © 2018年 durban.zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QWImageView : UIImageView {
    id _target;
    SEL _sel;
}

- (void) addTarget: (id)target withSelector: (SEL)sel;
@end
