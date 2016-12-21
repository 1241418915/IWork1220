//
//  ZHeadTableViewCell.m
//  IWork
//
//  Created by sh-lx on 16/10/26.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "ZHeadTableViewCell.h"
#import "Header.h"

@interface ZHeadTableViewCell ()
    

@end

@implementation ZHeadTableViewCell
    
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
        _leftImageView.backgroundColor=[UIColor greenColor];
        [self addSubview:_leftImageView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImageView.frame)+10, 25, 200, 30)];
        _nameLabel.backgroundColor=[UIColor yellowColor];
        _nameLabel.text = @"null";
        [self addSubview:_nameLabel];
        
        _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(Width-30, 25, 18, 32)];
       // _rightImageView.backgroundColor=[UIColor grayColor];
        _rightImageView.image = [UIImage imageNamed:@"right.png"];
//        [self addSubview:_rightImageView];
        
        _chaKanImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMinX(_rightImageView.frame)-35, CGRectGetMinY(_rightImageView.frame), 32, 32)];
        _chaKanImageView.image = [UIImage imageNamed:@"查看@3x.png"];
        _chaKanImageView.backgroundColor=[UIColor grayColor];
        [self addSubview:_chaKanImageView];
        
        
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
