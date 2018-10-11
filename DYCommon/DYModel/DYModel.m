//
//  DYModel.m
//  DYLib
//
//  Created by Mac mini of dy  on 2018/5/31.
//  Copyright © 2018年 mac mini. All rights reserved.
//

#import "DYModel.h"

@implementation DYModel



/**
 all property to sting add array

 @return proerty string array
 */
- (NSArray *)getAllProperties
{
    u_int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    
    return propertiesArray;
}


/**
 dic from zhe model

 @param nilString if value is nil add @"" of some eles, if input nil , dot`t add the key to dic
 @return dic of zhe model
 */
- (NSDictionary *)getDictionartAddNilString:(NSString *)nilString
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        
        if (nilString == nil) {
            if (propertyValue) [props setObject:propertyValue forKey:propertyName];
        } else {
            if (propertyValue){
                [props setObject:propertyValue forKey:propertyName];
            } else {
                [props setObject:nilString forKey:propertyName];
            }
        }
    }
    free(properties);
    
    return props;
}


/**
 jsonString from zhe model
 
 @param nilString if value is nil add @"" of some , don`t add the key to dic if input nil
 @return jsonString of zhe model
 */
- (NSString*)getJsonStringAddNilString:(NSString *)nilString
{
    NSDictionary * infoDict = [self getDictionartAddNilString:nilString];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:infoDict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonString = @"";
    if (! jsonData)
    {
        NSLog(@"Got an error: %@", error);
    }else
    {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    jsonString = [jsonString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];  //去除掉首尾的空白字符和换行字符
    [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return jsonString;
}




@end
