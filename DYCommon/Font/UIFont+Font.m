//
//  UIFont+Font.m
//  DYLib
//
//  Created by Mac mini of dy  on 2018/7/13.
//  Copyright © 2018年 mac mini. All rights reserved.
//

#import "UIFont+Font.h"
#import <objc/message.h>

@implementation UIFont (Font)

+ (UIFont *)px_systemFontOfSize:(CGFloat)pxSize {
    
    CGFloat pt = (pxSize/96)*72;
    
    NSLog(@"pt--%f",pt);
    UIFont *font = [self systemFontOfSize:pt];
    
    return font;
    
}

+ (UIFont *)px_boldSystemFontOfSize:(CGFloat)pxSize {
    CGFloat pt = (pxSize/96)*72;
    NSLog(@"pt--%f",pt);
    
    UIFont *font = [self boldSystemFontOfSize:pt];
    
    return font;
}


@end
