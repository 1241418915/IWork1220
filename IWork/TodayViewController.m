//
//  TodayViewController.m
//  IWork
//
//  Created by sh-lx on 16/10/25.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "TodayViewController.h"
#import "Header.h"
#import <Masonry.h>
#import "WorkCell1.h"
#import "WorkCell2.h"
#import "WorkCell3.h"
#import "TableHeaderView.h"
@interface TodayViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView * _thirdHeaderView;
    UITableView * _tableView;
    NSMutableArray * _statusArray;
    NSArray * _titleArray1;
}
@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addheaderView];
    _statusArray = [[NSMutableArray alloc] init];
    _titleArray1 = @[@"早晨签到",@"邮件查询",@"老板千里眼",@"工作日志",@"下午签到"];
    [self addTableView];
}
#pragma mark  添加表
-(void)addTableView
{
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_thirdHeaderView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
    }];
    
}
#pragma mark  表的方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //创建2个字典(由于第一个区不设置区头因此只创建两个)
    for (int i = 0; i < 2; i ++)
    {
        NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
        [dict setObject:@"YES" forKey:@"open"];
        [_statusArray addObject:dict];
    }

    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        //  先判断当前的状态是打开还是关闭从服务器返回的数组元素的个数
        NSDictionary * dict = [_statusArray objectAtIndex:section-1];
        if ([[dict valueForKey:@"open"] isEqualToString:@"YES"])
        {
            return 5;
        }
        else
        {
            return 0;
        }
    }
    else
    {
        NSDictionary * dict = [_statusArray objectAtIndex:section-1];
        if ([[dict valueForKey:@"open"] isEqualToString:@"YES"])
        {
            return 3;
        }
        else
        {
            return 0;
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 3 * JIAOLIU_CELL_HEIGHT;
    }
    else if(indexPath.section == 1)
    {
        return JIAOLIU_CELL_HEIGHT;
    }
    else
    {
        return JIAOLIU_CELL_HEIGHT +20;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString * string = @"cell";
        WorkCell1 * cell = [tableView dequeueReusableCellWithIdentifier:string];
        if (cell == nil)
        {
            cell = [[WorkCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
        }
        cell.backImageView.backgroundColor = [UIColor lightGrayColor];
        cell.timeLabel.text = @"10:13";
        cell.dateLabel.text = @"2016/10/27 星期四";
        cell.weatherLabel.text = @"21~28℃ 阴";
        cell.selectionStyle = UITableViewCellAccessoryNone;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        static NSString * identify2 = @"cell2";
        WorkCell2 * cell = [tableView dequeueReusableCellWithIdentifier:identify2];
        if (cell == nil)
        {
            cell = [[WorkCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify2];
        }
        if (indexPath.row%2==0)
        {
            cell.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
        }
        else
        {
            cell.backgroundColor = [UIColor whiteColor];
        }
        cell.headerImageView.backgroundColor = [UIColor redColor];
        cell.titleLabel.text = [_titleArray1 objectAtIndex:indexPath.row];
        cell.timeLabel.text = @"9:00";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    else
    {
        static NSString * identify3 = @"cell3";
        WorkCell3 * cell = [tableView dequeueReusableCellWithIdentifier:identify3];
        if (cell == nil)
        {
            cell = [[WorkCell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify3];
        }
        cell.headerImageView.backgroundColor = [UIColor lightGrayColor];
        cell.titleLabel.text = @"整理文件";
        cell.nameLabel.text = @"张三   星期四";
        cell.progressView.backgroundColor = [UIColor yellowColor];
        return cell;
    }
}
#pragma mark  区头和区尾
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0.1;
    }
    else if (section == 1)
    {
        return 10;
    }
    else
    {
        return 0.1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0.1;
    }
    else
    {
        return 40;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section != 0)
    {
        TableHeaderView * view = [[TableHeaderView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        if (section == 1)
        {
            view.titleLabel.text = @"日程安排";
        }
        else if (section == 2)
        {
            view.titleLabel.text = @"任务安排";
            UILabel * lineLabel = [[UILabel alloc] init];
            lineLabel.backgroundColor = LINE_COLOR;
            [view addSubview:lineLabel];
            [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(view);
                make.bottom.equalTo(view);
                make.right.equalTo(view);
                make.height.mas_equalTo(LINE_HEIGFT);
            }];
        }
        view.jianTouImageView.tag = 30 + section;
        NSMutableDictionary * dict = [_statusArray objectAtIndex:section -1];
        if ([[dict valueForKey:@"open"] isEqualToString:@"YES"])
        {
            view.jianTouImageView.backgroundColor = [UIColor redColor];
        }
        else
        {
            view.jianTouImageView.backgroundColor = [UIColor yellowColor];
        }
        view.addBtn.tag = 10+section;
        [view.addBtn addTarget:self action:@selector(addScheduleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        view.openOrCloseBtn.tag = 20 + section;
        [view.openOrCloseBtn addTarget:self action:@selector(openOrCloseBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        return view;
    }
    else
    {
        UIView * view = [[UIView alloc] init];
        return view;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}
#pragma mark  添加日程的点击事件
-(void)addScheduleBtnClick:(UIButton *)btn
{
    NSLog(@"添加日程");
}
#pragma mark  展开或关闭分组的点击事件
-(void)openOrCloseBtnClick:(UIButton *)btn
{
    NSDictionary * dict = [_statusArray objectAtIndex:btn.tag-20-1];
    UIImageView * jianTouImageView = (UIImageView *)[self.view viewWithTag:btn.tag + 10];
    if ([[dict objectForKey:@"open"] isEqualToString:@"YES"])
    {
        [dict setValue:@"NO" forKey:@"open"];
        jianTouImageView.backgroundColor = [UIColor yellowColor];
    }
    else
    {
        [dict setValue:@"YES" forKey:@"open"];
        jianTouImageView.backgroundColor = [UIColor redColor];
    }
    [_tableView reloadData];
}
#pragma mark  添加顶部的view
-(void)addheaderView
{
    _thirdHeaderView = [[UIView alloc] init];
    [self.view addSubview:_thirdHeaderView];
    _thirdHeaderView.backgroundColor = HEADER_VIEW_COLOR;
    [_thirdHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(20);
        make.height.mas_equalTo(44);
    }];
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"工作";
    [_thirdHeaderView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_thirdHeaderView);
        make.centerY.equalTo(_thirdHeaderView);
    }];
    [titleLabel sizeToFit];
    [self addSaoYiSao];
    [self addDaiBan];
}
#pragma mark  添加代办按钮
-(void)addDaiBan
{
    UIButton * daiBanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    daiBanBtn.backgroundColor = [UIColor redColor];
    [daiBanBtn addTarget:self action:@selector(daiBanBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_thirdHeaderView addSubview:daiBanBtn];
    [daiBanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_thirdHeaderView.mas_right).offset(-10);
        make.top.equalTo(_thirdHeaderView.mas_top).offset(5);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    UILabel * daiBanLabel = [[UILabel alloc] init];
    daiBanLabel.text = @"代办";
    daiBanLabel.font = [UIFont systemFontOfSize:12];
    [_thirdHeaderView addSubview:daiBanLabel];
    [daiBanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(daiBanBtn.mas_bottom);
        make.bottom.equalTo(_thirdHeaderView.mas_bottom);
        make.centerX.equalTo(daiBanBtn);
    }];
    [daiBanLabel sizeToFit];
}
#pragma mark  代办按钮触发事件
-(void)daiBanBtnClick
{
    
}
#pragma mark 扫一扫按钮
-(void)addSaoYiSao
{
    UIButton * saoYiSaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [saoYiSaoBtn setBackgroundImage:<#(nullable UIImage *)#> forState:UIControlStateNormal];
    saoYiSaoBtn.backgroundColor = [UIColor redColor];
    [saoYiSaoBtn addTarget:self action:@selector(saoYiSaoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_thirdHeaderView addSubview:saoYiSaoBtn];
    [saoYiSaoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_thirdHeaderView.mas_left).offset(10);
        make.top.equalTo(_thirdHeaderView.mas_top).offset(5);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    UILabel * saoYiSaoLabel = [[UILabel alloc] init];
    saoYiSaoLabel.text = @"扫一扫";
    saoYiSaoLabel.font = [UIFont systemFontOfSize:12];
    [_thirdHeaderView addSubview:saoYiSaoLabel];
    [saoYiSaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(saoYiSaoBtn.mas_bottom);
        make.bottom.equalTo(_thirdHeaderView.mas_bottom);
        make.centerX.equalTo(saoYiSaoBtn);
    }];
    [saoYiSaoLabel sizeToFit];
}
#pragma mark 扫一扫方法
-(void)saoYiSaoBtnClick
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
