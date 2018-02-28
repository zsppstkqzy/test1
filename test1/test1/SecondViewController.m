//
//  SecondViewController.m
//  test1
//
//  Created by zsp on 2018/2/27.
//  Copyright © 2018年 zsp. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.block = ^(NSString *text) {
//        text = self.textField.text;
//    }
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    if (self.block) {
        self.block(_textField.text);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dealloc
{
    NSLog(@"%s",__func__);    
}
@end
