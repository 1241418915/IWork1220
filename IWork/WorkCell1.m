//
//  WorkCell1.m
//  IWork
//
//  Created by sh-lx on 16/10/27.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "WorkCell1.h"
#import "Header.h"
#import <Masonry.h>
@implementation WorkCell1
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addcontent];
    }
    return self;
}
-(void)addcontent
{
    //添加一个imageview  + 时间 ,日期,温度,天气的label
    self.backImageView = [[UIImageView alloc] init];
    [self addSubview:self.backImageView];
    [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.top.equalTo(self);
        make.bottom.equalTo(self);
    }];
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.timeLabel];
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.font = [UIFont systemFontOfSize:9];
    [self addSubview: self.dateLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(self);
        make.height.mas_equalTo(self.dateLabel.mas_height).multipliedBy(2);
    }];
    [self.timeLabel sizeToFit];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-10);
        make.top.equalTo(self.timeLabel.mas_bottom);
        make.bottom.equalTo(self.mas_centerY);
    }];
    [self.dateLabel sizeToFit];
    self.weatherLabel = [[UILabel alloc] init];
    self.weatherLabel.font = [UIFont systemFontOfSize:11];
    [self addSubview:self.weatherLabel];
    [self.weatherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.top.equalTo(self.dateLabel.mas_bottom).offset(30);
    }];
    [self.weatherLabel sizeToFit];
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
