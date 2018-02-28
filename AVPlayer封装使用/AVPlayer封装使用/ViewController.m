//
//  ViewController.m
//  AVPlayer封装使用
//
//  Created by zsp on 2018/2/27.
//  Copyright © 2018年 zsp. All rights reserved.
//

#import "ViewController.h"
//#import "RemotePlayer.h"
#import "XMGRemotePlayer.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totleTimeLabel;
@property (weak, nonatomic) IBOutlet UIButton *rateButton;
@property (strong, nonatomic) XMGRemotePlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
-(XMGRemotePlayer *)player
{
    if (!_player) {
        _player = [[XMGRemotePlayer alloc] init];
    }
    return _player;
}
- (void)setUI{
    
}
- (IBAction)playe:(id)sender {
    [self.player playWithURL:[NSURL URLWithString:@"http://audio.xmcdn.com/group23/M04/63/C5/wKgJNFg2qdLCziiYAGQxcTOSBEw402.m4a"]];
}
- (IBAction)shangyishou:(id)sender {
    
}
- (IBAction)nextOne:(id)sender {
    
}
- (IBAction)setUpRate:(id)sender {
    __weak typeof(self) weekSelf = self;
    [self setAlertController:^(float number) {
        weekSelf.player.rate = number;
    }];
}

- (void)setAlertController:(void(^)(float number))block{
    UIAlertController *numberAlert = [UIAlertController alertControllerWithTitle:@"速度" message:@"请填写播放速度" preferredStyle:UIAlertControllerStyleAlert];
    [numberAlert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        block([textField.text floatValue]);
    }];
    [numberAlert addAction: [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [numberAlert addAction: [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:numberAlert animated:YES completion:nil];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.player playWithURL:[NSURL URLWithString:@"http://m10.music.126.net/20180227200324/06ee673cff142c253b5d9af04bf362fb/ymusic/8117/dca5/e04e/726233ec4347760270f0f963de39dce1.mp3"]];
}
@end
