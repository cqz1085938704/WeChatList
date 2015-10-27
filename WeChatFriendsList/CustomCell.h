//
//  CustomCell.h
//  WeChatFriendsList
//
//  Created by caiyao's Mac on 15/10/26.
//  Copyright © 2015年 core's Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "NSString+CalculateSize.h"

typedef NS_ENUM(NSInteger, CellStyle)
{
    CellTypeLeft,
    CellTypeRight
};

@interface CustomCell : UITableViewCell

@property (nonatomic, assign)CellStyle cellStyle;

@end
