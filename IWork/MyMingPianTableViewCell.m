//
//  MyMingPianTableViewCell.m
//  IWork
//
//  Created by sh-lx on 16/10/26.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "MyMingPianTableViewCell.h"
#import "Header.h"

@interface MyMingPianTableViewCell ()
    
  
    

@end

@implementation MyMingPianTableViewCell
    
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
        _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 8, 140, 24)];
//        _leftLabel.backgroundColor = [UIColor grayColor];
        _leftLabel.text = @"null";
        [self addSubview:_leftLabel];
        
        _rightLbel = [[UILabel alloc]initWithFrame:CGRectMake(Width/2, 10, Width/2-10, 18)];
//        _rightLbel.backgroundColor=[UIColor grayColor];
        _rightLbel.textAlignment = 2;
        _rightLbel.text = @"null";
        [self addSubview:_rightLbel];
        
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
