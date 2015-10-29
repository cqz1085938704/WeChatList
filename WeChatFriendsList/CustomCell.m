//
//  CustomCell.m
//  WeChatFriendsList
//
//  Created by caiyao's Mac on 15/10/26.
//  Copyright © 2015年 core's Mac. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell ()
{
    CAShapeLayer *layer;
}
@end

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
    
    layer = [CAShapeLayer layer];
    [self.layer addSublayer:layer];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = [self.textLabel.text sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(WIN_SIZE.width - 90, CGFLOAT_MAX)];
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    switch (self.cellStyle)
    {
        case CellTypeLeft:
        {
            self.imageView.frame = CGRectMake(10, 10, 60, 60);
            
            self.textLabel.frame = CGRectMake(80, 10, size.width, size.height);
            self.textLabel.backgroundColor = [UIColor lightGrayColor];
            
            
            [path moveToPoint:CGPointMake(80, 20)];
            [path addLineToPoint:CGPointMake(70, 25)];
            [path addLineToPoint:CGPointMake(80, 30)];
            
            layer.path = path.CGPath;
            layer.fillColor = [UIColor lightGrayColor].CGColor;
        }
            break;
        case CellTypeRight:
        {
            self.imageView.frame = CGRectMake(WIN_SIZE.width - 10 - 60, 10, 60, 60);
            
            self.textLabel.frame = CGRectMake(WIN_SIZE.width - 80 - size.width, 10, size.width, size.height);
            self.textLabel.backgroundColor = [UIColor orangeColor];
            
            [path moveToPoint:CGPointMake(WIN_SIZE.width - 80, 20)];
            [path addLineToPoint:CGPointMake(WIN_SIZE.width - 70, 25)];
            [path addLineToPoint:CGPointMake(WIN_SIZE.width - 80, 30)];
            
            layer.path = path.CGPath;
            layer.fillColor = [UIColor orangeColor].CGColor;
        }
            break;
        default:
            break;
    }
}


@end
