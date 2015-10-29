//
//  Util.h
//  WeChatFriendsList
//
//  Created by caiyao's Mac on 15/10/27.
//  Copyright © 2015年 core's Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CompletionHandler)(NSData *data, NSURLResponse *response, NSError *error);

@interface Util : NSObject

+ (void)requestDataFromUrl:(NSString *)urlStr completionHandler:(CompletionHandler) completionHandler;

@end
