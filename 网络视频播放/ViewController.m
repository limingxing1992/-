//
//  ViewController.m
//  网络视频播放
//
//  Created by qianfeng on 15/12/3.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "ViewController.h"

#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

#define URL @"http://baobab.cdn.wandoujia.com/14468618701471.mp4"
#define kScreenWidth self.view.frame.size.width
#define kScreenHright self.view.frame.size.height


@interface ViewController ()<AVPlayerViewControllerDelegate>

//@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;//视频播放器

@property (nonatomic, strong) AVPlayerViewController *moviePlayer;

@property (nonatomic, strong) UIActivityIndicatorView *avView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    self.avView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.avView.center = CGPointMake(kScreenWidth / 2, kScreenHright /2);
    
    
    self.avView.backgroundColor = [UIColor blackColor];
    self.avView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 60, 80, 40)];
    label.font = [UIFont systemFontOfSize:14];
    label.text = @"loading....";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [self.avView addSubview:label];
    
    
    [self playMedia];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)playMedia
{
    self.moviePlayer = [[AVPlayerViewController alloc] init];
    self.moviePlayer.view.frame = self.view.bounds;
    self.moviePlayer.showsPlaybackControls = YES;
    self.moviePlayer.delegate = self;
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:URL]];
    
    self.moviePlayer.player = player;
    [self.view addSubview:self.moviePlayer.view];
    [player play];
    

}

- (BOOL)shouldAutorotate
{
    return YES;
}
//设置横屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeLeft;
}
@end
