//
//  NSString+CalculateSize.m
//  WeChatFriendsList
//
//  Created by caiyao's Mac on 15/10/27.
//  Copyright © 2015年 core's Mac. All rights reserved.
//

#import "NSString+CalculateSize.h"

@implementation NSString (CalculateSize)

-(CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

@end
