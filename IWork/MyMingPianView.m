//
//  MyMingPianView.m
//  IWork
//
//  Created by sh-lx on 16/10/26.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "MyMingPianView.h"
#import "Header.h"
#import "MyMingPianTableViewCell.h"

@interface MyMingPianView ()<UITableViewDelegate,UITableViewDataSource>
   
    @property(nonatomic,strong)UITableView *tableView;
    @property(nonatomic,strong)NSArray *myMPListArray;
    
@end

@implementation MyMingPianView

 - (instancetype)initWithFrame:(CGRect)frame
    {
        self = [super initWithFrame:frame];
        if (self) {
            //昵称  性别  生日  邮件  移动电话   办公电话   部门  职位   最后登陆时间
            _myMPListArray = @[@[@"昵称",@"性别",@"生日",@"邮件"],@[@"移动电话",@"办公电话"],@[@"部门",@"职位",@"最后登陆时间"]];
            
            [self addContents];
        }
        return self;
    }
    
  -(void)addContents
    {
      _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, Width, Height-64) style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = RGBA(247, 247, 247, 1);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [self addSubview:_tableView];
        
    }
 -(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
    {
        return 3;
    }
 -(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        if (section == 0) {
            return 4;
        }else if (section == 1){
            return 2;
        }else{
            return 3;
        }
    }
 -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        static NSString *identifier = @"idetifier";
        MyMingPianTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[MyMingPianTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        cell.leftLabel.text = [[_myMPListArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        return cell;
    }
 -(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
    {
        //view.backgroundColor = [UIColor redColor];
    }
 -(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
    {
        if (section == 0) {
            return  140.0;
        }else{
             return 20.0;
        }
        
    }
 -(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
    {
        return 0;
    }
 -(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
    {
        if (section == 0) {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 140)];
            
            //背景view
            UIImageView *bgimageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width, 120)];
//            bgimageView.backgroundColor=[UIColor grayColor];
            bgimageView.image = [UIImage imageNamed:@"9287_wh860.png"];
            [view addSubview:bgimageView];
            
            //头像
            UIImageView *headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(Width/2-20, 15, 40, 40)];
            headImageView.backgroundColor = [UIColor yellowColor];
            headImageView.image = [UIImage imageNamed:@"0182_wh860.png"];
            [bgimageView addSubview:headImageView];
            
            //昵称
            UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(headImageView.frame), Width, 20)];
            nameLabel.text = @"null";
            nameLabel.textAlignment = 1;
            [bgimageView addSubview:nameLabel];
            
            //座右铭
            UILabel *mottoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nameLabel.frame), Width, 20)];
            mottoLabel.text = @"简单快乐的工作，笑对生活";
            mottoLabel.textAlignment = 1;
            [bgimageView addSubview:mottoLabel];
            
            
            UILabel *downLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, Width, 20)];
            downLabel.text = @"个人信息";
            downLabel.textAlignment = 0;
            [view addSubview:downLabel];
            return view;
        }else{
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 20)];
            UILabel *label = [[UILabel alloc ]initWithFrame:CGRectMake(10, 0, Width, 20)];
            [view addSubview:label];
            switch (section) {
                case 1:
                label.text = @"联系方式";
                break;
                case 2:
                label.text = @"联系方式";
                break;
                
                default:
                break;
            }
            return view;
            
        }
    }
 
    
    
    
    
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
