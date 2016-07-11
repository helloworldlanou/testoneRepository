//
//  PoppingTableViewCell.m
//  Poping
//
//  Created by lanou on 16/7/11.
//  Copyright © 2016年 tongwei. All rights reserved.
//

#import "PoppingTableViewCell.h"
#import <pop/POP.h>
@implementation PoppingTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.textColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0  blue:(arc4random()%255)/255.0  alpha:1.0];
        self.textLabel.font = [UIFont boldSystemFontOfSize:self.frame.size.height/2.0];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        //选中状态
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];//指定动画属性
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
        [self.textLabel pop_addAnimation:scaleAnimation forKey:nil];
    }else{
        //非选中状态
        POPSpringAnimation *springScaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        springScaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
        springScaleAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(3.0, 3.0)];
        springScaleAnimation.springBounciness = 20;
        [self.textLabel pop_addAnimation:springScaleAnimation forKey:nil];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
