//
//  CommunicateViewController.m
//  IWork
//
//  Created by sh-lx on 16/10/25.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "CommunicateViewController.h"
#import "Header.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
#import "LiaoTianTableViewCell.h"
#import "LiaoTianCell2.h"
#import "ZuZhiCell.h"
#import "TongXunLuCell.h"
@interface CommunicateViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIView * _secondHeaderView;
    UISegmentedControl * _segmentedControl;
    UITableView * _tableView;
    NSArray * _groupNameArray;
    NSMutableArray * _statusArray;
    NSMutableArray * _jianTouImageViewArray;
}
@end

@implementation CommunicateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = HEADER_VIEW_COLOR;
    [self addSceondHeaderView];
    [self addSegment];
    [self addAddBtn];
    [self enterLiaoTianView];
    _groupNameArray = [NSArray arrayWithObjects:@"董事会",@"技术部",@"市场部",@"培训部", nil];
    
}
#pragma mark "添加功能"按钮
-(void)addAddBtn
{
    UIButton * addBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_secondHeaderView addSubview:addBtn];
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_secondHeaderView.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(_segmentedControl);
    }];
}
#pragma mark addBtnClick
-(void)addBtnClick
{
    NSLog(@"addBtn");
}
#pragma mark 添加选项卡
-(void)addSegment
{
    _segmentedControl= [[UISegmentedControl alloc ]initWithItems: @[@"聊天",@"组织架构",@"通讯录"]];
    _segmentedControl.selectedSegmentIndex = 0;
    [_segmentedControl addTarget:self action:@selector(changeSecondSegment:) forControlEvents:UIControlEventValueChanged];
    [_secondHeaderView addSubview:_segmentedControl];
    [_segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Width/5);
        make.right.mas_equalTo(-Width/5);
        make.top.equalTo(_secondHeaderView.mas_top).offset(10);
        make.bottom.equalTo(_secondHeaderView.mas_bottom).offset(-10);
    }];

}
#pragma mark  选项卡的触发事件
-(void)changeSecondSegment:(id)sender
{
    switch ([(UISegmentedControl *)sender selectedSegmentIndex]) {
        case 0:
            
            [self enterLiaoTianView];
            break;
        case 1:
            [self enterZuZhiView];
            break;
        case 2:
            [self enterTongXunLuView];
            break;
        default:
            break;
    }

}
#pragma mark 添加tableview
-(void)addTableView
{
    UIView * view1 = (UIView *)[self.view viewWithTag:10];
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [view1 addSubview:_tableView];
    if (_segmentedControl.selectedSegmentIndex == 0)
    {
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view1);
            make.right.equalTo(view1);
            make.top.equalTo(view1);
            make.bottom.equalTo(view1);
        }];
    }
    else if (_segmentedControl.selectedSegmentIndex == 1)
    {
        UIView * companyNameViw = (UIView *)[self.view viewWithTag:20];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view1);
            make.right.equalTo(view1);
            make.top.equalTo(companyNameViw.mas_bottom);
            make.bottom.equalTo(view1);
        }];
    }
    else
    {
        UIView * invitateView = (UIView *)[self.view viewWithTag:40];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view1);
            make.right.equalTo(view1);
            make.top.equalTo(invitateView.mas_bottom);
            make.bottom.equalTo(view1);
        }];
    }
    
}
#pragma mark tableview的协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_segmentedControl.selectedSegmentIndex == 0)
    {
        return 2;
    }
    else if (_segmentedControl.selectedSegmentIndex == 1)
    {
        if (_statusArray.count == 0)
        {
            // 创建四个字典放到_statusArray中
            for (int i = 0; i <4; i ++)
            {
                NSMutableDictionary * dict = [NSMutableDictionary dictionary];
                if (i == 0)
                {
                    [dict setObject:@"YES" forKey:@"open"];
                }
                else
                {
                    [dict setObject:@"NO" forKey:@"open"];
                }
                
                [_statusArray addObject:dict];
            }
        }
        return 4;
    }
    else
    {
        return 2;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_segmentedControl.selectedSegmentIndex == 0)
    {
        if (section == 0)
        {
            return 4;
        }
        else
        {
            return 3;
        }
    }
    else if (_segmentedControl.selectedSegmentIndex == 1)
    {
        //组织架构添加区头,每个区里的cell数量由服务器获取
        NSDictionary * dict = [_statusArray objectAtIndex:section];
            if ([[dict objectForKey:@"open"] isEqualToString:@"YES"])
            {
                return 4;
            }
            else
            {
                return 0;
            }
       
    }
    else
    {
        return 3;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  聊天里的
    if (_segmentedControl.selectedSegmentIndex == 0)
    {
        static NSString * identify1 = @"cell";
        static NSString * identify2 = @"cell2";
        if (indexPath.section == 0)
        {
            LiaoTianTableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:identify1];
            if (cell == nil)
            {
                cell = [[LiaoTianTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify1];
            }
            cell.headerImageView.backgroundColor = [UIColor redColor];
            cell.titleLabel.text = @"biaoti";
            
            //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        else
        {
            LiaoTianCell2 * cell = [_tableView dequeueReusableCellWithIdentifier:identify2];
            if (cell == nil)
            {
                cell = [[LiaoTianCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify2];
            }
            cell.headerImageView.backgroundColor = [UIColor redColor];
            cell.nameLabel.text = @"名字";
            cell.newsLabel.text = @"消息";
            cell.timeLabel.text = @"时间";
            //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }

    }
    else if (_segmentedControl.selectedSegmentIndex == 1)
    {
        static NSString * identify3 = @"cell3";
        ZuZhiCell * cell = [tableView dequeueReusableCellWithIdentifier:identify3];
        if (cell == nil)
        {
            cell = [[ZuZhiCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify3];
        }
        cell.headerImageView.backgroundColor = [UIColor yellowColor];
        cell.nameLabel.text = @"姓名";
        cell.phoneLabel.text = @"12345657892";
        return cell;
        
    }
    else
    {
        
        static NSString * identify4 = @"cell4";
        TongXunLuCell * cell = [tableView dequeueReusableCellWithIdentifier:identify4];
        if (cell == nil)
        {
            cell = [[TongXunLuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify4];
        }
        cell.headerImageView.backgroundColor = [UIColor redColor];
        cell.nameLabel.text = @"lao LIU";
        cell.phoneLabel.text = @"1231231231";
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_segmentedControl.selectedSegmentIndex == 0)
    {
        if (section == 0)
        {
            return 0.5;
        }
        else
        {
            return 20;
        }
    }
    else if (_segmentedControl.selectedSegmentIndex == 1)
    {
        return JIAOLIU_CELL_HEIGHT;
    }
    else
    {
        return 30;
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (_segmentedControl.selectedSegmentIndex == 0)
    {
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
        return view;
    }
    else if (_segmentedControl.selectedSegmentIndex == 1)
    {
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        //在区头添加label  imageview  button
        UILabel * groupNameLabel = [[UILabel alloc] init];
        groupNameLabel.text = [_groupNameArray objectAtIndex:section];
        groupNameLabel.textAlignment = NSTextAlignmentCenter;
        [view addSubview:groupNameLabel];
        [groupNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view.mas_left).offset(10);
            make.top.equalTo(view);
            make.bottom.equalTo(view);
            make.width.mas_equalTo(Width/5);
        }];
        UIImageView * jianTouImageView = [[UIImageView alloc] init];
        jianTouImageView.tag = 30 + section;
        [_jianTouImageViewArray addObject:jianTouImageView];
        //    phoneImageView.image = [UIImage imageNamed:<#(nonnull NSString *)#>]
        NSDictionary * statusDict = [_statusArray objectAtIndex:section];
        if ([[statusDict objectForKey:@"open"] isEqualToString:@"YES"])
        {
            //此处应该换成箭头的图片
            jianTouImageView.backgroundColor = [UIColor yellowColor];
        }
        else
        {
            //此处应该换成箭头的图片
            jianTouImageView.backgroundColor = [UIColor redColor];
        }
        
        [view addSubview:jianTouImageView];
        [jianTouImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(groupNameLabel.mas_right).offset(30);
            make.size.mas_equalTo(CGSizeMake(15, 15));
            make.centerY.equalTo(view);
        }];
        UIButton * groupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        groupBtn.tag = section;
        [groupBtn addTarget:self action:@selector(groupBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:groupBtn];
        [groupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view);
            make.right.equalTo(view);
            make.top.equalTo(view);
            make.bottom.equalTo(view);
        }];
        //下划线
        UILabel * lineLabel = [[UILabel alloc] init];
        lineLabel.backgroundColor = LINE_COLOR;
        [view addSubview:lineLabel];
        [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view);
            make.right.equalTo(view);
            make.bottom.equalTo(view);
            make.height.mas_offset(LINE_HEIGFT);
        }];
        return view;
    }
    else
    {
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
        return view;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_segmentedControl.selectedSegmentIndex == 0)
    {
        if (indexPath.section == 0)
        {
            return JIAOLIU_CELL_HEIGHT;
        }
        else
        {
            return JIAOLIU_CELL_HEIGHT+20;
        }
    }
    else if (_segmentedControl.selectedSegmentIndex == 1)
    {
        return JIAOLIU_CELL_HEIGHT;
    }
    else
    {
        return JIAOLIU_CELL_HEIGHT + 20;
    }
    
}
#pragma mark groupBtnClick(打开或关闭分组)
-(void)groupBtnClick:(UIButton *)btn
{
    NSDictionary * dict = [_statusArray objectAtIndex:btn.tag];
    if ([[dict objectForKey:@"open"] isEqualToString:@"NO"])
    {
        for (NSDictionary * allDict in _statusArray)
        {
            [allDict setValue:@"NO" forKey:@"open"];
        }
        [dict setValue:@"YES" forKey:@"open"];
        [_tableView reloadData];
    }
    for (UIImageView * jianTouImageView in _jianTouImageViewArray)
    {
        if ([jianTouImageView isEqual:[_jianTouImageViewArray objectAtIndex:btn.tag]])
        {
            //此处应该换成箭头的图片
            jianTouImageView.backgroundColor = [UIColor yellowColor];
        }
        else
        {
            //此处应该换成箭头的图片
            jianTouImageView.backgroundColor = [UIColor redColor];
        }
    }
    
}
#pragma mark 选项卡进入聊天的界面
-(void)enterLiaoTianView
{
    UIView * view1 = (UIView *)[self.view viewWithTag:10];
    [view1 removeFromSuperview];
    UIView * liaoTianView = [[UIView alloc] init];
    liaoTianView.tag = 10;
    [self.view addSubview:liaoTianView];
    [liaoTianView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_secondHeaderView.mas_bottom).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-49);
    }];
    [self addTableView];
}
#pragma mark 选项卡进入组织架构的界面
-(void)enterZuZhiView
{
    _statusArray = [[NSMutableArray alloc] init];
    _jianTouImageViewArray = [[NSMutableArray alloc] init];
    UIView * view1 = (UIView *)[self.view viewWithTag:10];
    [view1 removeFromSuperview];
    UIView * ZuZhiView = [[UIView alloc] init];
    ZuZhiView.tag = 10;
    [self.view addSubview:ZuZhiView];
    [ZuZhiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_secondHeaderView.mas_bottom).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-49);
    }];
    [self addNameView];
    [self addTableView];
}
#pragma mark  在组织架构界面添加公司名称的view
-(void)addNameView
{
    UIView * view1 = (UIView *)[self.view viewWithTag:10];
    UIView * companyNameView = [[UIView alloc] init];
    companyNameView.tag = 20;
    [view1 addSubview:companyNameView];
    [companyNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1);
        make.top.equalTo(view1.mas_top);
        make.right.equalTo(view1);
        make.height.mas_equalTo(JIAOLIU_CELL_HEIGHT);
    }];
    UILabel * companyNameLabel = [[UILabel alloc] init];
    //  公司名称(从服务器获取)
    companyNameLabel.text = @"窝游信息技术";
    [companyNameView addSubview:companyNameLabel];
    [companyNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(companyNameView.mas_left).offset(10);
        make.right.equalTo(companyNameView);
        make.top.equalTo(companyNameView);
        make.bottom.equalTo(companyNameView);
    }];
    UILabel * lineLabelUp = [[UILabel alloc] init];
    lineLabelUp.backgroundColor = HEADER_VIEW_COLOR;
    [companyNameView addSubview:lineLabelUp];
    [lineLabelUp mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(companyNameView);
        make.right.equalTo(companyNameView);
        make.top.equalTo(companyNameView);
        make.height.mas_equalTo(LINE_HEIGFT);
    }];
    UILabel * lineLabelDown = [[UILabel alloc] init];
    lineLabelDown.backgroundColor = [UIColor blueColor];
    [companyNameView addSubview:lineLabelDown];
    [lineLabelDown mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(companyNameView);
        make.right.equalTo(companyNameView);
        make.bottom.equalTo(companyNameView);
        make.height.mas_equalTo(LINE_HEIGFT);
    }];
}
#pragma mark 选项卡进入通讯录界面
-(void)enterTongXunLuView
{
    UIView * view1 = (UIView *)[self.view viewWithTag:10];
    [view1 removeFromSuperview];
    UIView * tongXunLuView = [[UIView alloc] init];
    tongXunLuView.tag = 10;
    [self.view addSubview:tongXunLuView];
    [tongXunLuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_secondHeaderView.mas_bottom).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-49);
    }];
    [self addSearchBar];
    [self addTableView];
}
#pragma mark 通讯录界面添加searchBar
-(void)addSearchBar
{
    UIView * view1 = (UIView *)[self.view viewWithTag:10];
    UISearchBar * searchBar = [[UISearchBar alloc]init];
    searchBar.placeholder = @"请输入搜索内容";
    searchBar.backgroundImage = [[UIImage alloc] init];
    //    _searchBar.delegate = self;
    //    _searchBar.tintColor =  LHColor(196, 196, 196);
    //取出textfield
    [self.view addSubview:searchBar];
    UITextField *searchField=[searchBar valueForKey:@"_searchField"];
    
    
    searchField.borderStyle = UITextBorderStyleRoundedRect;
    searchField.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
    searchField.layer.cornerRadius = 4.0;
    searchField.leftViewMode=UITextFieldViewModeNever;
    searchField.textColor=[UIColor whiteColor];
    //改变placeholder的颜色
    
    [searchField setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1.mas_left).offset(0);
        make.right.equalTo(view1.mas_right).offset(0);
        make.top.equalTo(_secondHeaderView.mas_bottom).offset(5);
    }];
    
    // 添加按钮(邀请同事)
    UIView * invitateView = [[UIView alloc] init];
    invitateView.backgroundColor = HEADER_VIEW_COLOR;
    invitateView.tag = 40;
    [view1 addSubview:invitateView];
    [invitateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view1);
        make.right.equalTo(view1);
        make.top.equalTo(searchBar.mas_bottom).offset(0);
        make.height.mas_equalTo(JIAOLIU_CELL_HEIGHT + 20);
    }];
    UIImageView * invitateImageView = [[UIImageView alloc] init];
//    invitateImageView.image = [UIImage imageNamed:@""];
    invitateImageView.backgroundColor = [UIColor redColor];
    [invitateView addSubview:invitateImageView];
    [invitateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(invitateView.mas_left).offset(10);
        make.top.equalTo(invitateView.mas_top).offset(25);
        make.bottom.equalTo(invitateView.mas_bottom).offset(-5);
        make.width.mas_equalTo(invitateImageView.mas_height);
    }];
    UILabel * invitateLabel = [[UILabel alloc] init];
    invitateLabel.text = @"邀请同事";
    [invitateView addSubview:invitateLabel];
    [invitateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(invitateImageView.mas_right).offset(20);
        make.top.equalTo(invitateView.mas_top).offset(20);
        make.bottom.equalTo(invitateView);
        make.right.equalTo(invitateView);
    }];
    UIButton * invitateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    invitateBtn.backgroundColor = [UIColor whiteColor];
    [invitateBtn addTarget:self action:@selector(invitateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [invitateView addSubview:invitateBtn];
    [invitateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(invitateView);
        make.right.equalTo(invitateView);
        make.top.equalTo(invitateView).offset(20);
        make.bottom.equalTo(invitateView);
    }];
    //  把视图前置否则btn会遮挡imageview和label
    [invitateView bringSubviewToFront:invitateImageView];
    [invitateView bringSubviewToFront:invitateLabel];
}
#pragma mark  通讯录"邀请同事"触发事件
-(void)invitateBtnClick
{
    NSLog(@"邀请同事按钮");
}
#pragma mark 添加headerView
-(void)addSceondHeaderView
{
    _secondHeaderView = [[UIView alloc] init];
    [self.view addSubview:_secondHeaderView];
    _secondHeaderView.backgroundColor = HEADER_VIEW_COLOR;
    [_secondHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(20);
        make.height.mas_equalTo(44);
    }];
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
