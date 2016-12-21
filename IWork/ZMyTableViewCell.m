//
//  ZMyTableViewCell.m
//  IWork
//
//  Created by sh-lx on 16/10/26.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "ZMyTableViewCell.h"
#import "Header.h"

@interface ZMyTableViewCell ()

    
@end

@implementation ZMyTableViewCell
    
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
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        _leftImageView.backgroundColor=[UIColor grayColor];
        [self addSubview:_leftImageView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_leftImageView.frame)+10, 10, 200, 20)];
//        _nameLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:_nameLabel];
        
        
        _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(Width-30, 5, 18, 32)];
        //_rightImageView.backgroundColor=[UIColor grayColor];
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
