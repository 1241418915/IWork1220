//
//  DynamicTableViewCell.m
//  IWork
//
//  Created by sh-lx on 16/10/28.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "DynamicTableViewCell.h"
#import <Masonry.h>
#import "DynamicTableViewModel.h"
#import "Header.h"


@interface DynamicTableViewCell ()
{
     NSString *imgStr;
}

/*
 __weak IBOutlet UIImageView *headImg;
 
 __weak IBOutlet UILabel *username;
 
 __weak IBOutlet UILabel *contentText;
 
 __weak IBOutlet UIView *newImage;
 
 __weak IBOutlet UILabel *review;
 */

    @property(nonatomic,strong)UIImageView *headImg;

    @property(nonatomic,strong)UIButton *connectBtn;

    @property(nonatomic,strong)UILabel *username;

    @property(nonatomic,strong)UILabel *timeLabel;

    @property(nonatomic,strong)UILabel *contentText;

    @property(nonatomic,strong)UIView *nawImageView;

//    点赞按钮
    @property(nonatomic,strong)UIButton *dianZanBtn;

//    评论按钮
    @property(nonatomic,strong)UIButton *reViewBtn;

    //评论列表
    @property(nonatomic,strong)UILabel *review;


@end

@implementation DynamicTableViewCell


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
    
    //头像
    _headImg = [[UIImageView alloc]init];
    _headImg.backgroundColor = [UIColor greenColor];
    [self addSubview:_headImg];
    
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self).offset(10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
        
    }];
    
    //联系
    _connectBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _connectBtn.backgroundColor = [UIColor redColor];
    _connectBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_connectBtn setTitle:@"联系" forState:(UIControlStateNormal)];
    [self addSubview:_connectBtn];
    [_connectBtn addTarget:self action:@selector(lianxi) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    [_connectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(self).offset(10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];

    
    
    //用户名
    _username = [[UILabel alloc]init];
    _username.backgroundColor = [UIColor yellowColor];
    [self addSubview:_username];
    
    [_username mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImg.mas_right).offset(5);
        make.top.equalTo(self).offset(10);
        make.right.equalTo(_connectBtn.mas_left).offset(-10);
        make.height.mas_equalTo(15);
    }];
    
    
    //时间
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.backgroundColor = [UIColor grayColor];
    [self addSubview:_timeLabel];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImg.mas_right).offset(5);
        make.top.equalTo(_username.mas_bottom).offset(5);
        make.right.equalTo(_connectBtn.mas_left).offset(-10);
        make.height.mas_equalTo(15);
    }];
    
    
   
    
//    评论按钮
    _reViewBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _reViewBtn.backgroundColor = [UIColor greenColor];
    [_reViewBtn setTitle:@"评论" forState:(UIControlStateNormal)];
    _reViewBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_reViewBtn];
    [_reViewBtn addTarget:self action:@selector(comment) forControlEvents:(UIControlEventTouchUpInside)];
   
    //    评论按钮
    [_reViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-15);
        make.bottom.equalTo(self).offset(-18);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(15);
    }];

    
    
    //    点赞
    _dianZanBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    _dianZanBtn.backgroundColor = [UIColor grayColor];
    [_dianZanBtn setTitle:@"点赞" forState:(UIControlStateNormal)];
    _dianZanBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_dianZanBtn];
    [_dianZanBtn addTarget:self action:@selector(praise) forControlEvents:(UIControlEventTouchUpInside)];
    
    
     //    点赞
    [_dianZanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_reViewBtn.mas_left).offset(-30);
        make.bottom.equalTo(self).offset(-18);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(15);
    }];
    
    
    //    内容
    _contentText = [[UILabel alloc]init];
    _contentText.text = @"123";
    _contentText.backgroundColor =[UIColor grayColor];
    [self addSubview:_contentText];
    
    //图片
    _nawImageView = [[UIView alloc]init];
    _nawImageView.backgroundColor=[UIColor yellowColor];
    [self addSubview:_nawImageView];
    
    //    内容
    [_contentText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(_timeLabel.mas_bottom).offset(5);
        make.bottom.equalTo(_nawImageView.mas_top).offset(-5);
    }];
    
    //图片
    [_nawImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(_contentText.mas_bottom).offset(-5);
        make.bottom.equalTo(_reViewBtn.mas_top).offset(-5);
    }];
    
}

-(void)setMyModel:(DynamicTableViewModel *)myModel{
    
    //_headImg.image = [UIImage imageNamed:myModel.headImg];
    _headImg.image = [UIImage imageNamed:@"asd.png"];
    
    _username.text = myModel.name;
    
    _username.text = @"小猪";
    
    _contentText.text = myModel.trends;
    _contentText.numberOfLines = 3;
    _review.text = myModel.reviewStr;
   // _review.numberOfLines = 0;
    _review.backgroundColor = [UIColor cyanColor];
    [self imageViewWithImg:myModel.contentImgs];
   // imgStr = myModel.contentImgs;
    imgStr =  @"asd,asd,asd,asd,asd,asd,asd,asd,asd";
}

//发表的图片
-(void)imageViewWithImg:(NSString*)imgName{
    
    NSArray *imgs = [imgName componentsSeparatedByString:@","];
    for (NSInteger i=0;i<imgs.count;i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((kSpace+imgWidth)*(i%3),(kSpace+imgWidth)*(i/3), imgWidth, imgWidth)];
        imageView.image = [UIImage imageNamed:imgs[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [imageView addGestureRecognizer:tap];
        [_nawImageView addSubview:imageView];
    }
}
-(void)tapAction:(UITapGestureRecognizer*)tap{
    
    NSArray *imgs = [imgStr componentsSeparatedByString:@","];
    [self.myDelegate checkImage:imgs[tap.view.tag]];
}

- (void)comment
{
    
    [self.delegate publishReiseOrPraise:@"comment" cellTag:self.tag];
}

- (void)praise
{
    
    [self.delegate publishReiseOrPraise:@"praise" cellTag:self.tag];
}
-(void)lianxi
{
    [self.delegate publishReiseOrPraise:@"lianXi" cellTag:self.tag];
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
