//
//  SecondViewController.h
//  test1
//
//  Created by zsp on 2018/2/27.
//  Copyright © 2018年 zsp. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol NothingDeldgate<NSObject>
- (void)getSome:(NSString *)massage;
@end
@interface SecondViewController : UIViewController

@property (nonatomic,weak) id <NothingDeldgate>delegate;
@property (nonatomic,copy) void (^block)(NSString *text);
@end
