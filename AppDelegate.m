//
//  AppDelegate.m
//  BeautyChange
//
//  Created by SinoKor on 16/4/7.
//  Copyright © 2016年 chenyong. All rights reserved.
//

#import "AppDelegate.h"

#import "RouterFactory.h"

#import "GeRenVC.h"
#import "EHospitalVC.h"
#import "InfomationVC.h"
#import "EBuyVC.h"
#import "JingXuanVC.h"
//导航栏颜色
#define KCOLOR_NAV [UIColor whiteColor]
//标签栏未选中颜色
#define KCOLOR_BAR_NORMAL [UIColor grayColor]

#define KCOLOR_PINK [UIColor colorWithRed:171.0/250 green:9.0/250  blue:85.0/250  alpha:1]
@interface AppDelegate ()
{
    UITabBarController *tabBarVC;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
  //  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[RouterFactory shareDefault] initWindow:self.window];
    [WXApi registerApp:WXLOGIN_ID];
    CGRect aaa = [[UIScreen mainScreen] bounds];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"firstlogin"] ==nil)
    {
        ViewController* view = [[ViewController alloc] init];
        
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:view];
        [nav setNavigationBarHidden:YES];
        [[nav navigationBar]setBarTintColor:KCOLOR_NAV];
        [[[RouterFactory shareDefault] router] modifyRootController:nav];
        [view showBlock:^(ViewController* vc){
            [self showTabBar];
        
        }];
    }
    else
    {
        [self showTabBar];
    }
    [self.window makeKeyAndVisible];
    
   
    return YES;
}

- (void)showTabBar
{
    tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.tabBar.backgroundColor=[UIColor redColor];
    GeRenVC* vc_geren = [[GeRenVC alloc]init];
    EHospitalVC* vc_es = [[EHospitalVC alloc]init];
    InfomationVC* vc_info = [[InfomationVC alloc]init];
    EBuyVC* vc_eb = [[EBuyVC alloc]init];
    JingXuanVC* vc_jx = [[JingXuanVC alloc]init];
    NSArray* array = [[NSArray alloc] initWithObjects:vc_geren,vc_es,vc_info,vc_eb,vc_jx, nil];
    NSArray* nameArray = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    NSArray* imageArray = [[NSArray alloc] initWithObjects:@"4_circle",@"4_circle",@"4_circle",@"4_circle",@"4_circle", nil];
    [tabBarVC setSelectedIndex:0];
    NSMutableArray *arrayNav = [[NSMutableArray alloc] init];
    for (int i=0; i<array.count; i++) {
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:array[i]];
        [[nav navigationBar]setBarTintColor:KCOLOR_NAV];
        [arrayNav addObject:nav];
        
    }
    UIView * mView=[[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 48)];//这是整个tabbar的颜色
    [mView setBackgroundColor:[UIColor whiteColor]];
    [tabBarVC.tabBar insertSubview:mView atIndex:1];
    mView.alpha=0.8;
    UITabBar *tabBar =tabBarVC.tabBar;
    tabBarVC.viewControllers =arrayNav;
    for (int i=0; i<array.count; i++)
    {
        UITabBarItem *tabBarItem=[tabBar.items  objectAtIndex:i];
        
        tabBarItem =[tabBarItem initWithTitle:nameArray[i] image:[[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:imageArray[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:KCOLOR_BAR_NORMAL, NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:KCOLOR_PINK, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    }
    [[[RouterFactory shareDefault] router] modifyRootController:tabBarVC];
 
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if([sourceApplication  isEqual: @"com.tencent.xin"])
    {
        return  [WXApi handleOpenURL:url delegate:self];
    }
    else if([sourceApplication  isEqual: @"com.tencent.weixin"])
    {
        
    }
    return [TencentOAuth HandleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL isSuc = [WXApi handleOpenURL:url delegate:self];
    NSLog(@"url %@ isSuc %d",url,isSuc == YES ? 1 : 0);
    return  isSuc;
    return [TencentOAuth HandleOpenURL:url];
}

/*! @brief 收到一个来自微信的请求，第三方应用程序处理完后调用sendResp向微信发送结果
 *
 * 收到一个来自微信的请求，异步处理完成后必须调用sendResp发送处理结果给微信。
 * 可能收到的请求有GetMessageFromWXReq、ShowMessageFromWXReq等。
 * @param req 具体请求内容，是自动释放的
 */
-(void) onReq:(BaseReq*)req
{
}
/*! @brief 发送一个sendReq后，收到微信的回应
 *
 * 收到一个来自微信的处理结果。调用一次sendReq后会收到onResp。
 * 可能收到的处理结果有SendMessageToWXResp、SendAuthResp等。
 * @param resp具体的回应内容，是自动释放的
 */
-(void) onResp:(BaseResp*)resp
{
    SendAuthResp* resp_auth = (SendAuthResp*)resp;
    if(resp.errCode == 0)
    {
        NSString* code = resp_auth.code;
        
        NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",WXLOGIN_ID,WXLOGIN_SECRET,code]];
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
        session.responseSerializer.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"text/html", @"text/plain",nil];
        [session GET:URL.absoluteString parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
             NSLog(@" responseObject = %@",responseObject);
            [ProgressHUD showSuccess:@"微信登录成功"];
            NSLog(@"微信登录成功");
            [self showTabBar];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Error: %@", error);
            NSLog(@"微信登录失败");
        }];
    }
}
@end
