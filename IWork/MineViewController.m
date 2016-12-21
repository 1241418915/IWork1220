//
//  MineViewController.m
//  IWork
//
//  Created by sh-lx on 16/10/25.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "MineViewController.h"
#import "Header.h"
#import "ZTopView.h"
#import "ZHeadTableViewCell.h"
#import "ZQiYeQTableViewCell.h"
#import "ZMyTableViewCell.h"
#import "MyMingPianViewController.h"
#import "MyZiLiaoViewController.h"
#import "MoreSettingViewController.h"
#import "HelpViewController.h"
#import "MyZhuJiViewController.h"
#import "FileCenterViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *mycellArray;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
 
   
    
    
    _mycellArray =@[@{@"image":@"资料",@"txt":@"我的资料"},
                    @{@"image":@"足迹",@"txt":@"我的足迹"},
                    @{@"image":@"文件-(1)",@"txt":@"手机文件中心"},
                    @{@"image":@"邀请-(1)",@"txt":@"邀请同事加入本企业"},
                    @{@"image":@"微信-(1)",@"txt":@"微信推荐朋友"},
                    @{@"image":@"帮助中心-(1)",@"txt":@"帮助中心"},
                    @{@"image":@"设置",@"txt":@"更多设置"}];
    

    /*
     *添加ZtopView
     */
    [self adTopView];
    
    
    
   
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, Height-64-49) style:(UITableViewStyleGrouped)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _tableView.separatorColor = RGBA(247, 247, 247, 1);
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];

    
    
    
    
    
    
}


-(void)viewDidAppear:(BOOL)animated{
    //[self hideTabBar];
    [self showTabBar];
}
/*
 *显示TabBar：
 */
- (void)showTabBar

{
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
    
    contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    
    else
    
    contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = NO;
    
}

-(void)adTopView
{
    ZTopView *topView = [[ZTopView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    topView.titleLabel.text = @"我的";
    //    topView.backgroundColor = [UIColor redColor];
    topView.userInteractionEnabled = YES;
    [self.view addSubview:topView];
}
#pragma mark   UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 3;
    }else if (section == 3){
        return 2;
    }else if (section == 4){
        return 2;
    }else
    {
        return 0;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier0 = @"cell0";
    ZHeadTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:cellidentifier0];
    
    static NSString *cellidentifier1 = @"cell1";
    ZQiYeQTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellidentifier1];
    
    static NSString *cellidentifier2 = @"cell2";
    ZMyTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellidentifier2];
    
    if (indexPath.section == 0) {
        if (!cell0) {
            cell0 = [[ZHeadTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellidentifier0];
        }
//        cell0.leftImageView.image = [UIImage imageNamed:@"0182_wh860.png"];
        cell0.accessoryType = YES;
        return cell0;
    }else if (indexPath.section == 1){
        if (!cell1) {
            cell1 = [[ZQiYeQTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellidentifier1];
        }
//        cell1.leftImageView.image = [UIImage imageNamed:@"圈子.png"];
        cell1.accessoryType = YES;
        return cell1;
    }else {
        if (!cell2) {
            cell2 = [[ZMyTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellidentifier2];
        }
        
        if (indexPath.section == 2) {
//            cell2.leftImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[[_mycellArray objectAtIndex:indexPath.row ] objectForKey:@"image"]]];
            cell2.nameLabel.text = [[_mycellArray objectAtIndex:indexPath.row] objectForKey:@"txt"];
        }else if (indexPath.section == 3){
//            cell2.leftImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[[_mycellArray objectAtIndex:indexPath.row+3 ] objectForKey:@"image"]]];
            cell2.nameLabel.text = [[_mycellArray objectAtIndex:indexPath.row+3] objectForKey:@"txt"];
        }else{
//            cell2.leftImageView.image =[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[[_mycellArray objectAtIndex:indexPath.row+5 ] objectForKey:@"image"]]];
            cell2.nameLabel.text = [[_mycellArray objectAtIndex:indexPath.row+5] objectForKey:@"txt"];
        }
        cell2.accessoryType = YES;
        
        return cell2;
    }
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  6.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0 ||indexPath.section==1) {
        return 80.0;
    }else{
        return 40.0;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MyMingPianViewController *mymingPianVC = [[MyMingPianViewController alloc]init];
      
                                                  
        [self.navigationController pushViewController:mymingPianVC animated:YES];
        
        
       // [self presentViewController:mymingPianVC animated:NO completion:nil];
    }else if (indexPath.section == 2){
        if (indexPath.row == 0 ) {
            MyZiLiaoViewController *myziLiaoVC = [[MyZiLiaoViewController alloc]init];
            
            [self.navigationController pushViewController:myziLiaoVC animated:NO];
            
           // [self presentViewController:myziLiaoVC animated:NO completion:nil];
        }else if (indexPath.row ==1){
            MyZhuJiViewController *zhuJiVC = [[MyZhuJiViewController alloc]init];
            
            [self.navigationController pushViewController:zhuJiVC animated:NO];
        }else{
            FileCenterViewController *fileCenterVC = [[FileCenterViewController alloc]init];
            
            [self.navigationController pushViewController:fileCenterVC animated:NO];
        }
    }else if (indexPath.section == 4){
        if (indexPath.row == 0) {
            HelpViewController *helpVC = [[HelpViewController alloc]init];
            
            [self.navigationController pushViewController:helpVC animated:NO];
        }else if (indexPath.row == 1) {
            MoreSettingViewController *myMoreSetVC = [[MoreSettingViewController alloc]init];
            
            [self.navigationController pushViewController:myMoreSetVC animated:NO];
        }
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
