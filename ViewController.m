//
//  ViewController.m
//  BeautyChange
//
//  Created by SinoKor on 16/4/7.
//  Copyright © 2016年 chenyong. All rights reserved.
//

#import "ViewController.h"
#import "LoginVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.avaudioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    [self.avaudioSession setCategory:AVAudioSessionCategoryAmbient error:&error];
    
    
    
    NSString *urlStr = [[NSBundle mainBundle]pathForResource:@"1.mp4" ofType:nil];
    
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    
    _moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:url];
    //    _moviePlayer.controlStyle = MPMovieControlStyleDefault;
    [_moviePlayer play];
    [_moviePlayer.view setFrame:self.view.bounds];
    
    [self.view addSubview:_moviePlayer.view];
    _moviePlayer.shouldAutoplay = YES;
    [_moviePlayer setControlStyle:MPMovieControlStyleNone];
    [_moviePlayer setFullscreen:YES];
    
    [_moviePlayer setRepeatMode:MPMovieRepeatModeOne];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playbackStateChanged)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:_moviePlayer];
    
    
    _alpaView = [[UIView alloc]initWithFrame:self.view.bounds];
    _alpaView.backgroundColor = [UIColor clearColor];
    
    [_moviePlayer.view addSubview:_alpaView];
    
    _regiset = [[UIButton alloc]initWithFrame:CGRectMake(30*SCALE, kScreenHeight*0.85f, 140*SCALE, 70*SCALE)];
    [_regiset.titleLabel setFont:[UIFont fontWithName:@"Arial" size:30.0f*SCALE]];
    [_regiset setTitle:@"立即体验" forState:UIControlStateNormal] ;
    [_regiset setBackgroundColor:[UIColor blackColor]];
    [_regiset setAlpha:0.5f];
    [_regiset addTarget:self action:@selector(regBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_alpaView addSubview:_regiset];
    
    _login = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth - 170*SCALE, kScreenHeight*0.85f, 140*SCALE, 70*SCALE)];
    [_login.titleLabel setFont:[UIFont fontWithName:@"Arial" size:30.0f*SCALE]];
    [_login setTitle:@"注册/登录" forState:UIControlStateNormal] ;
    [_login setBackgroundColor:[UIColor blackColor]];
    [_login setAlpha:0.5f];
    [_login addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_alpaView addSubview:_login];
    
    

}
- (void)loginBtnClick:(UIButton*)sender
{
    LoginVC* logvc = [[LoginVC alloc] init];
    [self.navigationController pushViewController:logvc animated:YES];
 
}
- (void)regBtnClick:(UIButton*)sender
{
   // [(AppDelegate*)[UIApplication sharedApplication].delegate showTabBar];
    _blocks(self);
}

-(void)showBlock:(login_new_block)loginBlock
{
    _blocks = loginBlock;
}
-(void)shownotBlock:(login_new_block)loginBlock
{
    _nblocks = loginBlock;
}
-(void)playbackStateChanged{
    
    
    //取得目前状态
    MPMoviePlaybackState playbackState = [_moviePlayer playbackState];
    
    //状态类型
    switch (playbackState) {
        case MPMoviePlaybackStateStopped:
            [_moviePlayer play];
            break;
            
        case MPMoviePlaybackStatePlaying:
            NSLog(@"播放中");
            break;
            
        case MPMoviePlaybackStatePaused:
            [_moviePlayer play];
            break;
            
        case MPMoviePlaybackStateInterrupted:
            NSLog(@"播放被中断");
            break;
            
        case MPMoviePlaybackStateSeekingForward:
            NSLog(@"往前快转");
            break;
            
        case MPMoviePlaybackStateSeekingBackward:
            NSLog(@"往后快转");
            break;
            
        default:
            NSLog(@"无法辨识的状态");
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
