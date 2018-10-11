//
//  DYPredicate.m
//  DYLib
//
//  Created by mac mini on 2018/4/13.
//  Copyright © 2018年 mac mini. All rights reserved.
//

#import "DYPredicate.h"

@implementation DYPredicate

#pragma mark -- 手机号判断,更新到2018年1月，支持最新的166号段

/**
 手机号码 13[0-9],14[5|7|9],15[0-3],15[5-9],17[0|1|3|5|6|8],18[0-9]
 移动：134[0-8],13[5-9],147,15[0-2],15[7-9],178,18[2-4],18[7-8]
 联通：13[0-2],145,15[5-6],17[5-6],18[5-6]
 电信：133,1349,149,153,173,177,180,181,189
 虚拟运营商: 170[0-2]电信  170[3|5|6]移动 170[4|7|8|9],171 联通
 上网卡又称数据卡，14号段为上网卡专属号段，中国联通上网卡号段为145，中国移动上网卡号段为147，中国电信上网卡号段为149
 */

+(BOOL)checkMobilePhoneNo:(NSString *)phoneNum
{
    NSString * MOBIL = @"^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    if ([regextestmobile evaluateWithObject:phoneNum]) {
        return YES;
    }
    return NO;
}


#pragma mark - 18位身份证格式和合法性验证
+(BOOL)checkUserID:(NSString *)userID
{
    //长度不为18的都排除掉
    if (userID.length!=18) {
        return NO;
    }
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    //校验格式
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    BOOL flag = [identityCardPredicate evaluateWithObject:userID];
    
    if (!flag) {
        return flag;    //格式错误
    }else {
        //格式正确在判断是否合法
        
        //将前17位加权因子保存在数组里
        NSArray * idCardWiArray = @[@"7", @"9", @"10", @"5", @"8", @"4", @"2", @"1", @"6", @"3", @"7", @"9", @"10", @"5", @"8", @"4", @"2"];
        
        //这是除以11后，可能产生的11位余数、验证码，也保存成数组
        NSArray * idCardYArray = @[@"1", @"0", @"10", @"9", @"8", @"7", @"6", @"5", @"4", @"3", @"2"];
        
        //用来保存前17位各自乖以加权因子后的总和
        NSInteger idCardWiSum = 0;
        for(int i = 0;i < 17;i++)
        {
            NSInteger subStrIndex = [[userID substringWithRange:NSMakeRange(i, 1)] integerValue];
            NSInteger idCardWiIndex = [[idCardWiArray objectAtIndex:i] integerValue];
            
            idCardWiSum+= subStrIndex * idCardWiIndex;
            
        }
        
        //计算出校验码所在数组的位置
        NSInteger idCardMod=idCardWiSum%11;
        
        //得到最后一位身份证号码
        NSString * idCardLast= [userID substringWithRange:NSMakeRange(17, 1)];
        
        //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
        if(idCardMod==2)
        {
            if([idCardLast isEqualToString:@"X"]||[idCardLast isEqualToString:@"x"])
            {
                return YES;
            }else
            {
                return NO;
            }
        }else{
            //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
            if([idCardLast isEqualToString: [idCardYArray objectAtIndex:idCardMod]])
            {
                return YES;
            }
            else
            {
                return NO;
            }
        }
    }
}


#pragma mark - 车牌号格式校验(2018)
+(BOOL)checkCarID:(NSString *)carID
{
    NSPredicate *carTest;
    if (carID.length == 7) {
        //普通汽车
         NSString *creg = @"^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳]{1}$";
        carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", creg];
        return [carTest evaluateWithObject:carID];

    } else if (carID.length == 8) {
        //新能源车
        NSString *xreg = @"^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}(([0-9]{5}[DF]$)|([DF][A-HJ-NP-Z0-9][0-9]{4}$))";
        carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", xreg];
        return [carTest evaluateWithObject:carID];
    } else {
        return NO;
    }
}


#pragma mark - 6~16位数字/字母/下划线组成的密码格式校验
+(BOOL)checkPsw:(NSString *)pswStr
{
    NSString *pattern  =   @"^[A-Za-z0-9_]{6,16}$";
    NSPredicate * pred  =   [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    return [pred evaluateWithObject:pswStr];
}

#pragma mark - 判断字符串是否全为[(数字)OR(数字|字母)OR(字母)OR(汉字)]
+(BOOL)isAllCharacters:(NSString *)string type:(DYCharactersType)type
{
    NSString *condition;
    if (type == DYDigitalType) {
        condition = @"^[0-9]*$";//是否都是数字
    } else if (type == DYLetterType){
        condition = @"^[A-Za-z]+$";//是否都是字母
    }  else if (type == DYChineseCharactersType){
        condition = @"^[A-Za-z0-9]+$";//是否都是字母和数字
    } else {
        condition = @"^[\u4e00-\u9fa5]{0,}$";//只能输入汉字
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",condition];
    return [predicate evaluateWithObject:string];
}


#pragma mark - 银行卡格式验证
+(BOOL)checkBankCard:(NSString *)bankCard
{
    if (bankCard.length < 16) {
        return NO;
    }
    NSInteger oddsum = 0;     //奇数求和
    NSInteger evensum = 0;    //偶数求和
    NSInteger allsum = 0;
    NSInteger cardNoLength = (NSInteger)[bankCard length];
    // 取了最后一位数
    NSInteger lastNum = [[bankCard substringFromIndex:cardNoLength-1] intValue];
    //测试的是除了最后一位数外的其他数字
    bankCard = [bankCard substringToIndex:cardNoLength - 1];
    for (NSInteger i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [bankCard substringWithRange:NSMakeRange(i-1, 1)];
        NSInteger tmpVal = [tmpString integerValue];
        if (cardNoLength % 2 ==1 ) {//卡号位数为奇数
            if((i % 2) == 0){//偶数位置
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{//奇数位置
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

#pragma mark - 验证邮箱地址
+(BOOL)checkEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

#pragma mark - 小数判断
+(BOOL)checkFloatingPointNumbersString:(NSString *)num digits:(int)digits {
    NSString *numRegex = [NSString stringWithFormat:@"^\\d+(\\.\\d{1,%d})?$", digits];
    NSPredicate *numTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRegex];
    return [numTest evaluateWithObject:num];
}

+(BOOL)checkFloatingPointNumbers:(CGFloat)num digits:(int)digits {
    NSString *numRegex = [NSString stringWithFormat:@"^\\d+(\\.\\d{1,%d})?$", digits];
    NSPredicate *numTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRegex];
    NSString *numStr = [NSString stringWithFormat:@"%f", num];
    return [numTest evaluateWithObject:numStr];
}


@end
