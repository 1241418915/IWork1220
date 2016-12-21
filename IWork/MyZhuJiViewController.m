//
//  MyZhuJiViewController.m
//  IWork
//
//  Created by sh-lx on 16/10/26.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "MyZhuJiViewController.h"
#import "ZTopView.h"
#import "Header.h"

@interface MyZhuJiViewController ()

@end

@implementation MyZhuJiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    /*
     *顶部view
     */
    [self addTopView ];
    
    
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

/*
 *顶部view
 */
-(void)addTopView
{
    ZTopView *topView = [[ZTopView alloc]initWithFrame:CGRectMake(0, 0, Width, 64)];
    topView.titleLabel.text = @"我的足迹";
    [self.view addSubview:topView];
    
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    backBtn.frame = CGRectMake(0, 20, 44, 44);
    [backBtn setTitle:@"返回" forState:(UIControlStateNormal)];
    [backBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [topView addSubview:backBtn];
    [backBtn addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
}
/*
 *返回上一页面
 **/
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
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
