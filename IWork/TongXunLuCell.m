//
//  TongXunLuCell.m
//  IWork
//
//  Created by sh-lx on 16/10/27.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "TongXunLuCell.h"
#import "Header.h"
#import <Masonry.h>
@implementation TongXunLuCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor whiteColor];
        [self addcontent];
    }
    return self;
}
-(void)addcontent
{
    self.headerImageView = [[UIImageView alloc] init];
    [self addSubview:self.headerImageView];
    self.headerImageView.layer.cornerRadius = (JIAOLIU_CELL_HEIGHT+20-20)/2;
    self.headerImageView.layer.masksToBounds = YES;
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.top.equalTo(self.mas_top).offset(10);
        make.width.mas_equalTo(self.headerImageView.mas_height);
    }];
    self.nameLabel = [[UILabel alloc] init];
    [self addSubview:self.nameLabel];
    self.phoneLabel = [[UILabel alloc] init];
    [self addSubview:self.phoneLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImageView.mas_right).offset(10);
        make.top.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self.phoneLabel.mas_top);
        make.height.equalTo(self.phoneLabel);
    }];
    
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom);
        make.bottom.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(self.nameLabel);
    }];
    //下划线
    UILabel * lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = LINE_COLOR;
    [self addSubview:lineLabel];
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(LINE_HEIGFT);
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
