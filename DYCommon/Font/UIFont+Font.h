//
//  UIFont+Font.h
//  DYLib
//
//  Created by Mac mini of dy  on 2018/7/13.
//  Copyright © 2018年 mac mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Font)
 //px --> pt
+ (UIFont *)px_systemFontOfSize:(CGFloat)pxSize;
+ (UIFont *)px_boldSystemFontOfSize:(CGFloat)pxSize;
@end
