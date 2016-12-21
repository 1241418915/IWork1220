//
//  TableHeaderView.m
//  IWork
//
//  Created by sh-lx on 16/10/28.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "TableHeaderView.h"
#import "Header.h"
#import <Masonry.h>
@implementation TableHeaderView
-(instancetype)init
{
    if (self = [super init])
    {
        [self addContent];
    }
    return self;
}
-(void)addContent
{
    self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.centerY.equalTo(self);
    }];
    [self.titleLabel sizeToFit];
    self.jianTouImageView = [[UIImageView alloc] init];
    [self addSubview:self.jianTouImageView];
    [self.jianTouImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(20);
        make.size.mas_equalTo(CGSizeMake(10, 10));
        make.centerY.equalTo(self);
    }];
    self.addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self addSubview:self.addBtn];

    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.mas_top).offset(8);
        make.bottom.equalTo(self.mas_bottom).offset(-8);
        make.width.equalTo(self.addBtn.mas_height);
    }];
    self.openOrCloseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.openOrCloseBtn];
    [self.openOrCloseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self.addBtn.mas_left);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
