//
//  ZuZhiCell.m
//  IWork
//
//  Created by sh-lx on 16/10/27.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "ZuZhiCell.h"
#import <Masonry.h>
#import "Header.h"
@implementation ZuZhiCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = HEADER_VIEW_COLOR;
        [self addcontent];
    }
    return self;
}
-(void)addcontent
{
    self.headerImageView = [[UIImageView alloc] init];
    [self addSubview:self.headerImageView];
    self.headerImageView.layer.cornerRadius = (JIAOLIU_CELL_HEIGHT-10)/2;
    self.headerImageView.layer.masksToBounds = YES;
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.top.equalTo(self.mas_top).offset(5);
        make.width.mas_equalTo(self.headerImageView.mas_height);
    }];
    self.nameLabel = [[UILabel alloc] init];
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImageView.mas_right).offset(10);
        make.top.equalTo(self);
        make.right.equalTo(self.mas_centerX);
        make.bottom.equalTo(self);
    }];
    self.phoneLabel = [[UILabel alloc] init];
    [self addSubview:self.phoneLabel];
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    [self.phoneLabel sizeToFit];
    UIImageView * phoneImageView = [[UIImageView alloc] init];
//    phoneImageView.image = [UIImage imageNamed:<#(nonnull NSString *)#>]
    phoneImageView.backgroundColor = [UIColor redColor];
    [self addSubview:phoneImageView];
    [phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.phoneLabel.mas_left).offset(-2);
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.centerY.equalTo(self);
    }];
    //下划线
    UILabel * lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = LINE_COLOR;
    [self addSubview:lineLabel];
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImageView);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_offset(LINE_HEIGFT);
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
