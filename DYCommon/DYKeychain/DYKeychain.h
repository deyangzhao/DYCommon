//
//  DYKeychain.h
//  DYLib
//
//  Created by Zhaody of dy  on 2018/4/18.
//  Copyright © 2018年 mac mini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface DYKeychain : NSObject

/**
 *  存储字符串到 KeyChain
 *
 *  @param string NSString
 */
+ (void)keyChainSave:(NSString *)string;

/**
 *  从 KeyChain 中读取存储的字符串
 *
 *  @return NSString
 */
+ (NSString *)keyChainLoad;

/**
 *  删除 KeyChain 信息
 */
+ (void)keyChainDelete;

@end
