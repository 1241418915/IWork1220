//
//  MyZiLiaoViewController.m
//  IWork
//
//  Created by sh-lx on 16/10/26.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "MyZiLiaoViewController.h"
#import "Header.h"
#import "ZTopView.h"

@interface MyZiLiaoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *ziliaoArray;

@end

@implementation MyZiLiaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    _ziliaoArray = @[@"昵称",@"姓名",@"性别",@"生日",@"部门",@"角色",@"手机",@"邮箱",@"办公电话",@"个性签名"];
    
    
    [self addTopView];
   
    
    
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,Width , Height-64) style:(UITableViewStyleGrouped)];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    tableView.separatorColor = RGBA(247, 247, 247, 1);
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    [self.view addSubview:tableView];
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
    //顶部视图
    ZTopView *topView = [[ZTopView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    topView.titleLabel.text =  @"我的资料";
    [self.view addSubview:topView];
    
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    backBtn.frame = CGRectMake(0, 20, 44, 44);
    [backBtn setTitle:@"返回" forState:(UIControlStateNormal)];
    [backBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [topView addSubview:backBtn];
    [backBtn addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *saveBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    saveBtn.frame = CGRectMake(Width-44, 20, 44, 44);
    [saveBtn setTitle:@"编辑" forState:(UIControlStateNormal)];
    [saveBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [topView addSubview:saveBtn];
    [saveBtn addTarget:self action:@selector(save) forControlEvents:(UIControlEventTouchUpInside)];
}


 -(void)back
    {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
 -(void)save
    {
        NSLog(@"保存");
        
    }
    
#pragma mark  UITableViewDelegate
    
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        return 11;
    }
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
    {
        return 1;
    }
    
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        static NSString *identifier0 = @"identifier0";
        UITableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:identifier0];
        
        static NSString *identifier1 =@"identifier1";
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:identifier1];
        
        if (indexPath.row == 0) {
            if (!cell0) {
                cell0 = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier0];
            }
            cell0.accessoryType = YES;
            cell0.imageView.image = [UIImage imageNamed:@"0182_wh860.png"];
            
            return cell0;
        }else{
            if (!cell1) {
                cell1 = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier1];
            }
            cell1.textLabel.text = [_ziliaoArray objectAtIndex:indexPath.row-1];
            
            
            return cell1;
        }
        
    }
    -(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
    {
        return 2.0;
    }
    -(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        if (indexPath.row == 0) {
            return 60.0;
        }else{
            return 40.0;
        }
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
