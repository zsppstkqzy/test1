//
//  ViewController.m
//  test1
//
//  Created by zsp on 2018/2/27.
//  Copyright © 2018年 zsp. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
//#import "NSObject+massage.h"
#import "XMGRemotePlayer.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) SecondViewController *svc;
@property (strong, nonatomic) XMGRemotePlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *string = [UIButton  buttonWithType:UIButtonTypeCustom];
//    [string stringByAppendingString:@"111"];
}
- (IBAction)next:(id)sender {
    self.svc = [SecondViewController new];
//    _svc.delegate = self;
   
    self.svc.block = ^(NSString *text) {
        self.label.text = text;
    };
    [self.navigationController pushViewController:_svc animated:YES];
}
-(XMGRemotePlayer *)player
{
    if (!_player) {
        _player = [[XMGRemotePlayer alloc] init];
    }
    return _player;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.player playWithURL:[NSURL URLWithString:@"http://m10.music.126.net/20180227200324/06ee673cff142c253b5d9af04bf362fb/ymusic/8117/dca5/e04e/726233ec4347760270f0f963de39dce1.mp3"]];
}




@end
