//
//  DYTextFile.m
//  DYLib
//
//  Created by Mac mini of dy  on 2018/7/13.
//  Copyright © 2018年 mac mini. All rights reserved.
//

#import "DYTextFile.h"

@implementation DYTextFile

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)drawTextInRect:(CGRect)rect {
    UIColor *placeholderColor = [UIColor greenColor];//设置颜色
    [placeholderColor setFill];
    
    CGRect placeholderRect = CGRectMake(rect.origin.x+10, (rect.size.height- self.font.pointSize)/2, rect.size.width, self.font.pointSize);//设置距离
    
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByTruncatingTail;
    style.alignment = self.textAlignment;
    NSDictionary *attr = [NSDictionary dictionaryWithObjectsAndKeys:style,NSParagraphStyleAttributeName, self.font, NSFontAttributeName, placeholderColor, NSForegroundColorAttributeName, nil];
    
    [self.placeholder drawInRect:placeholderRect withAttributes:attr];
}


- (void)drawPlaceholderInRect:(CGRect)rect{
    UIColor *placeholderColor = [UIColor redColor];//设置颜色
    [placeholderColor setFill];
    
    CGRect placeholderRect = CGRectMake(rect.origin.x+10, (rect.size.height- self.font.pointSize)/2, rect.size.width, self.font.pointSize);//设置距离
    
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByTruncatingTail;
    style.alignment = self.textAlignment;
    NSDictionary *attr = [NSDictionary dictionaryWithObjectsAndKeys:style,NSParagraphStyleAttributeName, self.font, NSFontAttributeName, placeholderColor, NSForegroundColorAttributeName, nil];
    
    [self.placeholder drawInRect:placeholderRect withAttributes:attr];
}


@end
