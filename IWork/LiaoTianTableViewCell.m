//
//  LiaoTianTableViewCell.m
//  IWork
//
//  Created by sh-lx on 16/10/27.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "LiaoTianTableViewCell.h"
#import "Header.h"
#import <Masonry.h>
@implementation LiaoTianTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addContents];
    }
    return self;
}
-(void)addContents
{
    UILabel * lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = LINE_COLOR;
    [self addSubview:lineLabel];
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.height.mas_offset(LINE_HEIGFT);
    }];
    self.headerImageView = [[UIImageView alloc] init];
    self.headerImageView.layer.cornerRadius = 4;
    self.headerImageView.layer.masksToBounds = YES;
    [self addSubview:self.headerImageView];
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(5);
        make.top.equalTo(self.mas_top).offset(5);
        make.width.equalTo(self.headerImageView.mas_height);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
    }];
    self.titleLabel = [[UILabel alloc] init];
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImageView.mas_right).offset(5);
        make.right.equalTo(self);
        make.top.equalTo(self.headerImageView);
        make.bottom.equalTo(self.headerImageView);
    }];
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
