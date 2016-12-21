//
//  ZQiYeQTableViewCell.m
//  IWork
//
//  Created by sh-lx on 16/10/26.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "ZQiYeQTableViewCell.h"
#import "Header.h"

@interface ZQiYeQTableViewCell ()
   

@end

@implementation ZQiYeQTableViewCell

    
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
    {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            [self addContents];
        }
        return self;
    }
    
-(void)addContents
    {
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
        _leftImageView.backgroundColor=[UIColor grayColor];
        [self addSubview:_leftImageView];
        
        _qYTopLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImageView.frame)+10, 10, 200, 30)];
//        _qYTopLabel.backgroundColor = [UIColor yellowColor];
        _qYTopLabel.text = @"企业圈";
        [self addSubview:_qYTopLabel];
        
        _qYDownLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImageView.frame)+10, CGRectGetMaxY(_qYTopLabel.frame)+10, 200, 20)];
//        _qYDownLabel.backgroundColor = [UIColor grayColor];
        _qYDownLabel.text = @"快来拓展你的人脉吧";
        [self addSubview:_qYDownLabel];
        
        _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(Width-30,25, 18, 32)];
//        _rightImageView.backgroundColor=[UIColor grayColor];
        _rightImageView.image = [UIImage imageNamed:@"right.png"];
//        [self addSubview:_rightImageView];
        
        
        
        
    }

    
    
    
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
