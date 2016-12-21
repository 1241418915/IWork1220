//
//  LiaoTianCell2.m
//  IWork
//
//  Created by sh-lx on 16/10/27.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "LiaoTianCell2.h"
#import <Masonry.h>
#import "Header.h"
@implementation LiaoTianCell2
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addContent];
    }
    return self;
}
-(void)addContent
{
    self.headerImageView = [[UIImageView alloc] init];
    [self addSubview:self.headerImageView];
    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.top.equalTo(self.mas_top).offset(10);
        make.width.mas_equalTo(self.headerImageView.mas_height);
    }];
    self.headerImageView.layer.cornerRadius = (JIAOLIU_CELL_HEIGHT+20-20)/2;
    self.headerImageView.layer.masksToBounds = YES;
    // nameLabel
    self.nameLabel = [[UILabel alloc] init];
    [self addSubview:self.nameLabel];
    self.newsLabel = [[UILabel alloc] init];
    [self addSubview:self.newsLabel];
    self.timeLabel = [[UILabel alloc] init];
    [self addSubview:self.timeLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImageView.mas_right).offset(5);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(self.newsLabel);
        make.bottom.equalTo(self.newsLabel.mas_top);
    }];
    // newsLabel
    
    [self.newsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerImageView.mas_right).offset(5);
        make.bottom.equalTo(self);
        make.top.equalTo(self.nameLabel.mas_bottom);
        make.height.equalTo(self.nameLabel);
    }];
    [self.newsLabel sizeToFit];
    //timeLabel
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-10);
        make.top.equalTo(self.nameLabel);
        make.bottom.equalTo(self.nameLabel);
    }];
    [self.timeLabel sizeToFit];
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
