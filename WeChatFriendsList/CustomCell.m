//
//  CustomCell.m
//  WeChatFriendsList
//
//  Created by caiyao's Mac on 15/10/26.
//  Copyright © 2015年 core's Mac. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.cellStyle = CellTypeLeft;
        self.textLabel.font = [UIFont systemFontOfSize:18];
        self.textLabel.numberOfLines = 0;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = [self calculateHeightOfText:self.textLabel.text constrainedToWith:WIN_SIZE.width - 90];
    
//    self.imageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.imageView.layer.borderWidth = 0.5;
    
    
    switch (self.cellStyle)
    {
        case CellTypeLeft:
        {
            self.imageView.frame = CGRectMake(10, 10, 60, 60);
            
            self.textLabel.frame = CGRectMake(80, 10, size.width, size.height);
            self.textLabel.backgroundColor = [UIColor lightGrayColor];
        }
            break;
        case CellTypeRight:
        {
            self.imageView.frame = CGRectMake(WIN_SIZE.width - 10 - 60, 10, 60, 60);
            
            self.textLabel.frame = CGRectMake(WIN_SIZE.width - 80 - size.width, 10, size.width, size.height);
            self.textLabel.backgroundColor = [UIColor orangeColor];
        }
            break;
        default:
            break;
    }
}

-(CGSize)calculateHeightOfText:(NSString *)text constrainedToWith:(CGFloat)width
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, 999999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil];
    
    return rect.size;
}

@end
