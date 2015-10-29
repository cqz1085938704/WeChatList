//
//  Util.m
//  WeChatFriendsList
//
//  Created by caiyao's Mac on 15/10/27.
//  Copyright © 2015年 core's Mac. All rights reserved.
//

#import "Util.h"

@implementation Util

+(void)requestDataFromUrl:(NSString *)urlStr completionHandler:(CompletionHandler)completionHandler
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:15];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (completionHandler)
        {
            completionHandler(data, response, error);
        }
        
    }];
    [dataTask resume];
}

@end

