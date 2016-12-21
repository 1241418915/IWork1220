//
//  jingXuanCollectionViewCell.m
//  IWork
//
//  Created by sh-lx on 16/10/26.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "jingXuanCollectionViewCell.h"
#import <Masonry.h>
#import "Header.h"
@implementation jingXuanCollectionViewCell
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addcontents];
    }
    
    return self;
}
#pragma mark addcontents
-(void)addcontents
{
    self.imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.centerX.equalTo(self.contentView);
        make.width.mas_equalTo(Width/8);
        make.height.mas_equalTo(Width/8);
        
    }];
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.imageView.mas_bottom);
        make.bottom.equalTo(self.contentView);
    }];
}
@end
