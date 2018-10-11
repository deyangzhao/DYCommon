//
//  DYHeader.h
//  DYLib
//
//  Created by mac mini on 2018/4/13.
//  Copyright © 2018年 mac mini. All rights reserved.
//

#ifndef DYHeader_h
#define DYHeader_h



#pragma mark -- iPad iPone 判断
/* 是否iPad */
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)


#pragma mark -- 获取系统版本
/* 获取系统版本 */
#define CurrentSystemVersion ［UIDevice currentDevice] systemVersion]
#define IOS_VERSION ［[UIDevice currentDevice] systemVersion] floatValue]

#pragma mark -- 屏幕适配
/* 屏幕适配 */
//屏幕宽高
#define Screen_H                    [UIScreen mainScreen].bounds.size.height
#define Screen_W                    [UIScreen mainScreen].bounds.size.width

//iPone_X 判断
#define is_iPhoneX          (Screen_W == 375.f && Screen_H == 812.f ? YES : NO)
#define BootomSafetyZone    (is_iPhoneX ? 20.f : 0.f)   //安全区
#define StatusBarHeight     (is_iPhoneX ? 44.f : 20.f)//电池栏高度
#define NavBarHeight        44.f    //nav高度
#define TabbarHeight        49.f    //tabbar高度
#define TopSpeace(x)        (NavBarHeight + StatusBarHeight + x)    //到nav下x高度
#define BottomSpeace(x)     (TabbarHeight + x)  //到tabbar上x高度
#define Status_NavBarHeight (NavBarHeight + StatusBarHeight) //nav和电池栏总高
//边距10的倍数
#define Margin(x)              (10.f * x)


#pragma mark -- Week Strong
/* Week Strong */
#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o##Strong = o;



#pragma mark -- GCD
/* GCD */
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
#define ONCE(block) dispatch_once(&oncePredicate, block)
#define AFTER(delayInSeconds,block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), block)



#pragma mark -- RGB颜色
/* RGB颜色 */
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]



#pragma mark -- 获取当前语言
/* 获取当前语言 */
#define CurrentLanguage (［NSLocale preferredLanguages] objectAtIndex:0])


#pragma mark -- 获取沙盒
/* 获取沙盒 */
#define kPathTemp       NSTemporaryDirectory()
#define kPathDocument   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define kPathCache      [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


#pragma mark -- 打印Log
/* 打印Log */
#ifdef DEBUG
#define DYLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define DYLog(...)









#endif /* DYHeader_h */
