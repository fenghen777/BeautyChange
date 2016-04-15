//
//  LoginView.m
//  BeautyChange
//
//  Created by SinoKor on 16/4/11.
//  Copyright © 2016年 chenyong. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
        //        [self createUI];
    }
    return  self;
}

- (void)createUI
{
    UIImageView* bgImageView = [[UIImageView alloc] initWithFrame:self.frame];
    [bgImageView setImage:[UIImage imageNamed:@"loginbg.jpg"]];
    [self addSubview:bgImageView];
    bgImageView.exclusiveTouch = YES;
    bgImageView.userInteractionEnabled = YES;
    UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake(20*SCALE, kScreenHeight*0.4f, kScreenWidth - 40*SCALE, 45*SCALE)];
    nameField.placeholder = @"请输入手机号";
    UIView *padding1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50*SCALE, 50*SCALE)];
    nameField.leftView = padding1;
    nameField.leftViewMode = UITextFieldViewModeAlways;
    nameField.layer.cornerRadius = 15;
    nameField.backgroundColor = RGBColor(241, 242, 244);
    nameField.clearButtonMode = UITextFieldViewModeAlways; //清除内容按钮
    [bgImageView addSubview:nameField];
    self.nameField = nameField;
    
    UIImageView* namePadView = [[UIImageView alloc] initWithFrame:CGRectMake(10*SCALE, 2.5*SCALE, 40*SCALE, 40*SCALE)];
    [namePadView setImage:[UIImage imageNamed:@"ICON-Y"]];
    [self.nameField addSubview:namePadView];
    
    UITextField *passwordField = [[UITextField alloc]initWithFrame:CGRectMake(20*SCALE, kScreenHeight*0.4f+65*SCALE, kScreenWidth-40*SCALE, 45*SCALE)];
    passwordField.placeholder = @"密码";
    UIView *padding2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50*SCALE, 50*SCALE)];
    passwordField.leftView = padding2;
    passwordField.leftViewMode = UITextFieldViewModeAlways;
    passwordField.layer.cornerRadius = 15;
    passwordField.backgroundColor = RGBColor(241, 242, 244);
    passwordField.secureTextEntry = YES;  //输入内容设置隐藏(安全模式) 输入密码的密码显示为小圆点
    passwordField.userInteractionEnabled = YES;
    [bgImageView addSubview:passwordField];
    self.passwordField = passwordField;
    
    UIImageView* passwordPadView = [[UIImageView alloc] initWithFrame:CGRectMake(10*SCALE, 2.5*SCALE, 40*SCALE, 40*SCALE)];
    [passwordPadView setImage:[UIImage imageNamed:@"ICON-M"]];
    [self.passwordField addSubview:passwordPadView];
    
    
    
    UIButton *buttonPass =[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-75*SCALE, kScreenHeight*0.4f+65*SCALE+2.5f*SCALE, 40*SCALE, 40*SCALE)];
    buttonPass.tag=100;
    [buttonPass setBackgroundImage:[UIImage imageNamed:@"icon-BY"] forState:UIControlStateNormal];
    [buttonPass addTarget:self action:@selector(buPass:) forControlEvents:UIControlEventTouchUpInside];
    [bgImageView addSubview:buttonPass];
    
    UIButton *btnLogin =[[UIButton alloc]initWithFrame:CGRectMake(20*SCALE, kScreenHeight*0.4f+130*SCALE, kScreenWidth-40*SCALE, 45*SCALE)];
    [btnLogin.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:35.0f*SCALE]];
    [btnLogin setTitle:@" 登   录 " forState:UIControlStateNormal] ;
    btnLogin.backgroundColor = RGBColor(138,11,66);
    [btnLogin setAlpha:0.85f];
    [btnLogin addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btnLogin.layer.cornerRadius = 15;

    [bgImageView addSubview:btnLogin];
    
    
    UIButton *forgetBtn =[[UIButton alloc]initWithFrame:CGRectMake(101*SCALE, kScreenHeight*0.4f+195*SCALE, 100*SCALE, 25*SCALE)];
    [forgetBtn.titleLabel setFont:[UIFont fontWithName:@"Arial" size:20.0f*SCALE]];
    forgetBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal] ;
    //forgetBtn.backgroundColor = [UIColor clearColor];
   // forgetBtn.backgroundColor = [UIColor yellowColor];
    [forgetBtn addTarget:self action:@selector(forgetPasswordClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgImageView addSubview:forgetBtn];
    
    UILabel* shuxianLabel = [[UILabel alloc] initWithFrame:CGRectMake(204*SCALE, kScreenHeight*0.4f+195*SCALE, 6*SCALE, 25*SCALE)];
    shuxianLabel.text = @"|";
    shuxianLabel.textColor = [UIColor whiteColor];
    [bgImageView addSubview:shuxianLabel];

    
    UIButton *regBtn =[[UIButton alloc]initWithFrame:CGRectMake(213*SCALE, kScreenHeight*0.4f+195*SCALE, 120*SCALE, 25*SCALE)];
    [regBtn.titleLabel setFont:[UIFont fontWithName:@"Arial" size:20.0f*SCALE]];
    regBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [regBtn setTitle:@"新用户注册" forState:UIControlStateNormal] ;
    //regBtn.backgroundColor = [UIColor clearColor];
    //regBtn.backgroundColor = [UIColor yellowColor];
    [regBtn addTarget:self action:@selector(regClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgImageView addSubview:regBtn];
    
    UILabel* otherLoginLabel = [[UILabel alloc] initWithFrame:CGRectMake(25*SCALE, kScreenHeight*0.85f, 364*SCALE, 20*SCALE)];
    [otherLoginLabel setFont:[UIFont fontWithName:@"Arial" size:20.0f*SCALE]];
    [otherLoginLabel setAdjustsFontSizeToFitWidth:YES];
    otherLoginLabel.text = @"————— 其他登录方式 —————";
    [otherLoginLabel setTextAlignment:NSTextAlignmentCenter];
    //otherLoginLabel.alpha = 0.6f;
    otherLoginLabel.textColor = [UIColor whiteColor];
   // otherLoginLabel.backgroundColor = [UIColor yellowColor];
    [bgImageView addSubview:otherLoginLabel];
    
    //QQ-ICON
    UIButton *qqBtn =[[UIButton alloc]initWithFrame:CGRectMake(154*SCALE, kScreenHeight*0.9f, 40*SCALE, 40*SCALE)];
    [qqBtn setImage:[UIImage imageNamed:@"QQ-ICON"] forState:UIControlStateNormal];
    
    [qqBtn addTarget:self action:@selector(QQLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgImageView addSubview:qqBtn];

    
    UIButton *weixinBtn =[[UIButton alloc]initWithFrame:CGRectMake(213*SCALE, kScreenHeight*0.9f, 40*SCALE, 40*SCALE)];
    [weixinBtn setImage:[UIImage imageNamed:@"WX-ICON"] forState:UIControlStateNormal];
    [weixinBtn addTarget:self action:@selector(WXLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgImageView addSubview:weixinBtn];

    

}

- (void)QQLoginClick:(UIButton*)sender
{
    TencentOAuth* _tencentOAuth = [[TencentOAuth alloc] initWithAppId:QQLOGIN_ID andDelegate:self];
    NSArray* _permissions = [[NSArray alloc] initWithObjects:@"get_user_info",@"get_simple_userinfo", @"add_t", nil];
    [_tencentOAuth authorize:_permissions inSafari:NO];
}

#pragma mark - TencentLoginDelegate

- (void)tencentDidLogin
{
     [ProgressHUD showSuccess:@"QQ登录成功"];
    [(AppDelegate*)[UIApplication sharedApplication].delegate showTabBar];
}

- (void)tencentDidNotLogin:(BOOL)cancelled
{

}

- (void)tencentDidNotNetWork
{

}

#pragma mark - TencentSessionDelegate

- (void)tencentDidLogout
{

}

- (void)responseDidReceived:(APIResponse*)response forMessage:(NSString *)message
{

}
- (void)WXLoginClick:(UIButton*)sender
{
    //构造SendAuthReq结构体
    SendAuthReq* req =[[SendAuthReq alloc ] init  ];
    req.scope = @"snsapi_userinfo" ;
    req.state = @"123" ;
    //第三方向微信终端发送一个SendAuthReq消息结构
    [WXApi sendReq:req];
}

- (void)forgetPasswordClick:(UIButton*)sender
{
}

- (void)regClick:(UIButton*)sender
{
    
}

-(void)buPass:(UIButton *)sender{
    UIButton* btn = (UIButton*)sender;
    if (sender.tag==100) {
        self.passwordField.secureTextEntry = NO;
        [btn setBackgroundImage:[UIImage imageNamed:@"icon-ZY"] forState:UIControlStateNormal];
        sender.tag=101;
    }else{
        self.passwordField.secureTextEntry = YES;
        [btn setBackgroundImage:[UIImage imageNamed:@"icon-BY"] forState:UIControlStateNormal];
        sender.tag=100;
    }
}

- (void)loginBtnClick:(UIButton*)sender
{
    if (self.nameField.text.length==0||self.passwordField.text.length==0) {
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"提示" message:@"手机号或密码为空" delegate:self cancelButtonTitle:nil
                                            otherButtonTitles:@"好的", nil];
        [alert show];
    }
}
@end
