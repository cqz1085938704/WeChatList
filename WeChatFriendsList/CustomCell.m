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
        [self setupCell];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupCell];
}

- (void)setupCell
{
    self.cellStyle = CellTypeLeft;
    self.textLabel.font = [UIFont systemFontOfSize:14];
    self.textLabel.numberOfLines = 0;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = [self.textLabel.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(WIN_SIZE.width - 90, CGFLOAT_MAX)];
    
    
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

@end
