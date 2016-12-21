//
//  MoreSettingViewController.m
//  IWork
//
//  Created by sh-lx on 16/10/26.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "MoreSettingViewController.h"
#import "Header.h"
#import "ZTopView.h"
#import <Masonry.h>
#import "ZGuanYuViewController.h"

@interface MoreSettingViewController ()<UITableViewDataSource,UITableViewDelegate>

    @property(nonatomic,strong)UITableView *tableView;


@end

@implementation MoreSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.view.backgroundColor = RGBA(238, 238, 238, 1);
    
  
    //add topview
    
    [self addTopView];
    
    
    
    
    _tableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, Height-64)];
    _tableView.backgroundColor = RGBA(238, 238, 238, 1);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    //[self hideTabBar];
    
    [self hideTabBar];
}
/*
 *隐藏tabbar
 **/
- (void)hideTabBar
{
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
    contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
    contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
}
-(void)addTopView
{
    ZTopView *topView = [[ZTopView alloc]initWithFrame:CGRectMake(0, 0, Width, 64)];
    topView.titleLabel.text = @"更多设置";
    [self.view addSubview:topView];
    
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    backBtn.frame = CGRectMake(0, 20, 44, 44);
    [backBtn setTitle:@"返回" forState:(UIControlStateNormal)];
    [backBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [topView addSubview:backBtn];
    [backBtn addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];

}
/*
 * back
 **/
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else if (section == 2){
        return 1;
    }else{
        return 1;
    }
    
    
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier0 = @"identifier0";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier0];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier0];
        
    }
    //@[@"导航设置",@[@"修改密码",@"解除企业绑定"],@"清除缓存",@"关于"];
    if (indexPath.section ==0) {
        
        cell.textLabel.text = @"导航设置";
    }else if (indexPath.section == 1){
        if (indexPath.row ==0) {
            cell.textLabel.text = @"修改密码";
        }else if (indexPath.row ==1){
            cell.textLabel.text = @"解除企业绑定";
        }
    }else if (indexPath.section == 2){
        cell.textLabel.text = @"清除缓存";
    }else{
        cell.textLabel.text = @"关于";
    }
    cell.accessoryType = YES;

    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return 200;
    }else
    {
        return 1.0;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = RGBA(238, 238, 238, 1);
        UIButton *zhuXiaoBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
        zhuXiaoBtn.backgroundColor = [UIColor whiteColor];
        zhuXiaoBtn.layer.cornerRadius = 5.0;
        zhuXiaoBtn.layer.borderWidth = 1;
        zhuXiaoBtn.layer.borderColor = [UIColor blueColor].CGColor;
        [zhuXiaoBtn setTitle:@"注销" forState:(UIControlStateNormal)];
        [view addSubview:zhuXiaoBtn];
        [zhuXiaoBtn addTarget:self action:@selector(zhuXiaoBtnClicked) forControlEvents:(UIControlEventTouchUpInside)];
        
        [zhuXiaoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).offset(40);
            make.right.equalTo(view).offset(-40);
            make.top.equalTo(view).offset(30);
            make.height.mas_equalTo(40);
        }];
        
        UILabel *label = [[UILabel  alloc]init];
        label.textColor = [UIColor blueColor];
        label.text = [NSString stringWithFormat:@"您的当前身份：%@",@"管理员"];
        label.textAlignment = 1;
        [view addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view);
            make.right.equalTo(view);
           
           make.top.equalTo(zhuXiaoBtn.mas_bottom).offset(30);
            make.height.mas_equalTo(24);
        }];
        
        
        
       
        return view;
    }else{
        return nil;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击 %ld",(long)indexPath.section);
    if (indexPath.section == 3) {
        ZGuanYuViewController *zguanYuVC = [[ZGuanYuViewController alloc]initWithNibName:@"ZGuanYuViewController" bundle:nil];
        
    [self.navigationController pushViewController:zguanYuVC animated:YES];
                                            
    }
}

-(void)zhuXiaoBtnClicked
{
    NSLog(@"注销");
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
