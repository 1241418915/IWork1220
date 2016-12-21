//
//  ZTopView.m
//  IWork
//
//  Created by sh-lx on 16/10/25.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "ZTopView.h"
#import "Header.h"
#import "Masonry.h"


@implementation ZTopView
    
- (id)initWithFrame:(CGRect)frame
    {
        self = [super initWithFrame:CGRectMake(0, 0, Width, 64)];
        if (self) {
            self.backgroundColor=HEADER_VIEW_COLOR;
            [self addContent];
        }
        return self;
    }
    
- (void)addContent
    {
        
        _titleLabel = [[UILabel alloc]init];
//        _titleLabel.backgroundColor = [UIColor yellowColor];
        _titleLabel.frame = CGRectMake(0, 44, Width, 20);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
       
        
    }
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
