//
//  DYModel.h
//  DYLib
//
//  Created by Mac mini of dy  on 2018/5/31.
//  Copyright © 2018年 mac mini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@interface DYModel : NSObject

/**
 all property to sting add array
 
 @return proerty string array
 */
- (NSArray *)getAllProperties;



/**
 dic from zhe model
 
 @param nilString if value is nil add @"" of some eles, if input nil , dot`t add the key to dic
 @return dic of zhe model
 */
- (NSDictionary *)getDictionartAddNilString:(NSString *)nilString;



/**
 jsonString from zhe model
 
 @param nilString if value is nil add @"" of some , don`t add the key to dic if input nil
 @return jsonString of zhe model
 */
- (NSString*)getJsonStringAddNilString:(NSString *)nilString;


@end
