//
//  ViewController.h
//  BeautyChange
//
//  Created by SinoKor on 16/4/7.
//  Copyright © 2016年 chenyong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"
typedef void (^login_new_block)(id);

@interface ViewController : UIViewController

@property(nonatomic,copy)login_new_block blocks;
-(void)showBlock:(login_new_block)loginBlock;

@property(nonatomic,copy)login_new_block nblocks;
-(void)shownotBlock:(login_new_block)loginBlock;

@property(nonatomic,strong)MPMoviePlayerController *moviePlayer;
@property(nonatomic ,strong)NSTimer *timer;
@property (nonatomic ,strong)  UIView *alpaView;

@property (nonatomic,strong)  UIButton *regiset;
@property (nonatomic,strong)  UIButton *login;
@property (nonatomic,strong)  UIScrollView *scrollView;

@property (weak, nonatomic)  UIPageControl *pageControl;

@property(nonatomic ,strong)AVAudioSession *avaudioSession;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondViewLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thirdViewLeading;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fourViewLeading;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *firstLabelWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondLabelWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *thridLabelWidth;


- (void)loginBtnClick:(UIButton*)sender;
- (void)regBtnClick:(UIButton*)sender;
@end

