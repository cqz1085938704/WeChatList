//
//  MessageModel.h
//  WeChatFriendsList
//
//  Created by caiyao's Mac on 15/10/27.
//  Copyright © 2015年 core's Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Global.h"

@interface MessageModel : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) CellStyle style;

@end
