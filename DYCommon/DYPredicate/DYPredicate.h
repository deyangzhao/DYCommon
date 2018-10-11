//
//  DYPredicate.h
//  DYLib
//
//  Created by Zhaody on 2018/4/13.
//  Copyright © 2018年 mac mini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    DYDigitalType = 0,          //数字
    DYLetterType,               //字母
    DYChineseCharactersType,    //汉子
    DYDigitalOrLetterType       //数字或字母
}DYCharactersType;

/**
 *  正则表达式合法性判断
 */
@interface DYPredicate : NSObject


//手机号
+(BOOL)checkMobilePhoneNo:(NSString *)phoneNum;


//18位身份证格式和合法性验证
+(BOOL)checkUserID:(NSString *)userID;


//车牌号格式校验(粤A8888澳)
+(BOOL)checkCarID:(NSString *)carID;


//6~16位数字/字母/下划线组成的密码格式校验
+(BOOL)checkPsw:(NSString *)pswStr;


//判断字符串是否全为[(数字)OR(数字|字母)OR(字母)OR(汉字)]
+(BOOL)isAllCharacters:(NSString *)string type:(DYCharactersType)type;

//银行卡格式验证
+(BOOL)checkBankCard:(NSString *)bankCard;

//验证邮箱地址
+(BOOL)checkEmail:(NSString *)email;

//小数判断
+(BOOL)checkFloatingPointNumbersString:(NSString *)num digits:(int)digits;
+(BOOL)checkFloatingPointNumbers:(CGFloat)num digits:(int)digits;


@end
