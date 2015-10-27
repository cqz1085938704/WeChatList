//
//  NSString+CalculateSize.h
//  WeChatFriendsList
//
//  Created by caiyao's Mac on 15/10/27.
//  Copyright © 2015年 core's Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (CalculateSize)

- (CGSize)sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
