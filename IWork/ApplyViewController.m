//
//  ApplyViewController.m
//  IWork
//
//  Created by sh-lx on 16/10/25.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "ApplyViewController.h"
#import "jingXuanCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
#import <Masonry.h>
#import "Header.h"
@interface ApplyViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UIView * _headerView;
    UISegmentedControl *_segmentedControl;
    UICollectionView * _collectionView;
    UISearchBar * _searchBar;
    UIView * _commonView;
    NSArray * _titleArray1;
    NSArray * _fenLeiArray;
}
@end

@implementation ApplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
    [self addheaderView];
    [self addSaoYiSaoBtn];
    [self addSegmentControl];
    [self addDaiBanBtn];
    [self addsearchBar];
    _titleArray1 = [NSArray arrayWithObjects:@"邮件",@"公告",@"签到",@"足迹",@"网盘",@"工作日志",@"我的日程",@"库存管理",@"潜在客户",@"客户跟进",@"客户公海",@"用户管理", nil];
    [self addcollectionView];
//    [self enterJingXuanView];
}
#pragma mark addCollectionView
-(void)addcollectionView
{

    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake(Width/4, Width/4);
    layout.minimumInteritemSpacing =10;
    layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果
    if (_segmentedControl.selectedSegmentIndex ==2)
    {
        layout.minimumLineSpacing = 10;
    }
    layout.sectionInset = UIEdgeInsetsMake(10.f, 0, 9.f, 0);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = HEADER_VIEW_COLOR;
    [_collectionView registerClass:[jingXuanCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.view addSubview:_collectionView];

        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(0);
            make.right.equalTo(self.view);
            make.top.equalTo(_searchBar.mas_bottom).offset(20);
            make.bottom.equalTo(self.view.mas_bottom).offset(-49);
        }];

}
#pragma mark  collectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (_segmentedControl.selectedSegmentIndex ==0)
    {
        return 1;
    }
    else if (_segmentedControl.selectedSegmentIndex ==1)
    {
        return 3;
    }
    else
    {
        return 1;
    }
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_segmentedControl.selectedSegmentIndex ==0)
    {
        return 12;
    }
    else if (_segmentedControl.selectedSegmentIndex ==1)
    {
        return 5;
    }
    else
    {
        return 13;
    }
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify1 = @"cell1";
    jingXuanCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify1 forIndexPath:indexPath];
    if (!cell) {
            NSLog(@"-----------------");
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.layer.cornerRadius = 10;
    cell.contentView.layer.cornerRadius = 10.0f;
    cell.contentView.layer.borderWidth = 0.5f;
    cell.contentView.layer.borderColor = [UIColor clearColor].CGColor;
    cell.contentView.layer.masksToBounds = YES;
    cell.imageView.backgroundColor = [UIColor redColor];
    if (_segmentedControl.selectedSegmentIndex == 0)
    {
        cell.titleLabel.text = [_titleArray1 objectAtIndex:indexPath.item];
    }else if (_segmentedControl.selectedSegmentIndex == 1)
    {
        cell.titleLabel.text = @"标题";
    }
    else
    {
         cell.titleLabel.text = @"标题";
    }
    
    cell.titleLabel.textAlignment = NSTextAlignmentCenter;
    cell.titleLabel.font = [UIFont systemFontOfSize:15];
    return cell;
    
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    //声明头尾
    UICollectionReusableView *reusable = nil;
    //判断当前需要头还是尾
    if (kind == UICollectionElementKindSectionHeader)
    {
        //注册头
        reusable = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        reusable.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        
    }
        return reusable;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (_segmentedControl.selectedSegmentIndex == 1)
    {
        float width = Width;
        float height = 20;
        return CGSizeMake(width, height);
    }
    else
    {
        return CGSizeMake(Width, 0.1);
    }
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_segmentedControl.selectedSegmentIndex == 0)
    {
        return CGSizeMake(Width/4-1, Width/4-0.5);
    }
    else if (_segmentedControl.selectedSegmentIndex == 1)
    {
        if (indexPath.item == 0)
        {
            return CGSizeMake((Width*4/5/4)-5, 2 * (Width*4/5/4)-5);
        }
        else
        {
            return CGSizeMake((Width*4/5/4)-5, (Width*4/5/4)-5);
        }
        
    }
    else
    {
        return CGSizeMake((Width-40)/3, (Width-40)/3);
    }
    
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (_segmentedControl.selectedSegmentIndex == 2)
    {
        return UIEdgeInsetsMake(0, 5, 5,5);
    }
    else
    {
        return UIEdgeInsetsMake(0, 0, 0,0);
    }
}

//定义每个UICollectionView 的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}
#pragma mark addsearchBar
-(void)addsearchBar
{
    
//    _searchBar = [[UISearchBar alloc] init];
//    [self.view addSubview:_searchBar];
//    
//    _searchBar.tintColor = [UIColor lightGrayColor];
//    
////    //1.把searchBar里的UISearchBarBackground移除
////    [[_searchBar.subviews objectAtIndex:0]removeFromSuperview];
////    //2.
////    for (UIView *subview in _searchBar.subviews)
////    {
////        if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
////        {
////            [subview removeFromSuperview];
////            break;
////        }
////    }
////    //3自定义背景
////    _searchBar.backgroundColor = [UIColor colorWithRed:1 green:0.5 blue:0.5 alpha:0.5];
//    
//   UITextField * searchTextField = [_searchBar valueForKey:@"_searchField"];
//
//    searchTextField.borderStyle = UITextBorderStyleNone;
//    //        searchField.background = [UIImage imageNamed:@"ic_top"];
//    searchTextField.backgroundColor = [UIColor lightGrayColor];
//    searchTextField.layer.cornerRadius = 4.0;
//    searchTextField.leftViewMode=UITextFieldViewModeNever;
//    searchTextField.textColor=[UIColor lightGrayColor];
//    _searchBar.placeholder = @"搜索";
//
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.placeholder = @"请输入搜索内容";
    _searchBar.backgroundImage = [[UIImage alloc] init];
//    _searchBar.delegate = self;
//    _searchBar.tintColor =  LHColor(196, 196, 196);
    //取出textfield
    [self.view addSubview:_searchBar];
    UITextField *searchField=[_searchBar valueForKey:@"_searchField"];
    
    
    searchField.borderStyle = UITextBorderStyleRoundedRect;
    searchField.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
    searchField.layer.cornerRadius = 4.0;
    searchField.leftViewMode=UITextFieldViewModeNever;
    searchField.textColor=[UIColor whiteColor];
    //改变placeholder的颜色
    
    [searchField setValue:[UIColor whiteColor]forKeyPath:@"_placeholderLabel.textColor"];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(0);
        make.right.equalTo(self.view.mas_right).offset(0);
        make.top.equalTo(_headerView.mas_bottom).offset(5);
    }];
}
#pragma mark daiBanBtn
-(void)addDaiBanBtn
{
    UIButton * daiBanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    daiBanBtn.backgroundColor = [UIColor redColor];
    [daiBanBtn addTarget:self action:@selector(daiBanBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:daiBanBtn];
    [daiBanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_headerView.mas_right).offset(-10);
        make.top.equalTo(_headerView.mas_top).offset(5);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    UILabel * daiBanLabel = [[UILabel alloc] init];
    daiBanLabel.text = @"代办";
    daiBanLabel.font = [UIFont systemFontOfSize:12];
    [_headerView addSubview:daiBanLabel];
    [daiBanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(daiBanBtn.mas_bottom);
        make.bottom.equalTo(_headerView.mas_bottom);
        make.centerX.equalTo(daiBanBtn);
    }];
    [daiBanLabel sizeToFit];
}
#pragma mark daiBanBtnClick
-(void)daiBanBtnClick
{
    
}
#pragma mark addSegmentControl
-(void)addSegmentControl
{
    _segmentedControl= [[UISegmentedControl alloc ]initWithItems: @[@"精选",@"常用",@"导航"]];
    _segmentedControl.selectedSegmentIndex = 0;
    [_segmentedControl addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
    [_headerView addSubview:_segmentedControl];
    [_segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Width/5);
        make.right.mas_equalTo(-Width/5);
        make.top.equalTo(_headerView.mas_top).offset(10);
        make.bottom.equalTo(_headerView.mas_bottom).offset(-10);
    }];
}
#pragma mark changeSegment:
-(void)changeSegment:(id)sender
{
    switch ([(UISegmentedControl *)sender selectedSegmentIndex]) {
        case 0:
//            [self enterJingXuanView];
            [_collectionView reloadData];
            break;
        case 1:
            [_collectionView reloadData];
//            [self enterChangYongView];
            break;
        case 2:
            [_collectionView reloadData];
//            [self enterDaoHangView];
            break;
        default:
            break;
    }
    
}
#pragma mark entetJingXuanView
-(void)enterJingXuanView
{
    UIView * view1 = (UIView *)[self.view viewWithTag:10];
    [view1 removeFromSuperview];
    UIView * jingXuanView = [[UIView alloc] init];
    jingXuanView.tag = 10;
    jingXuanView.backgroundColor = [UIColor redColor];
    [self.view addSubview:jingXuanView];
    [jingXuanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_searchBar.mas_bottom).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
    }];
    [self addcollectionView];
}
#pragma mark enterChangYongVeiw
-(void)enterChangYongView
{
    UIView * view1 = (UIView *)[self.view viewWithTag:10];
    [view1 removeFromSuperview];
    UIView * chanYongView = [[UIView alloc] init];
    chanYongView.tag = 10;
    [self.view addSubview:chanYongView];
    [chanYongView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_searchBar.mas_bottom).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
    }];
    chanYongView.backgroundColor = [UIColor colorWithRed:238.0/255 green:238.0/255 blue:238.0/255 alpha:1];
    // 添加  按钮和图片
    _fenLeiArray = @[@"CRM",@"采购",@"库存"];
    for (int i=0;i<3; i ++ )
    {
        UIView* changyong = (UIView *)[self.view viewWithTag:10];
        UIView * fenLeiView = [[UIView alloc] init];
        [changyong addSubview:fenLeiView];
        fenLeiView.backgroundColor = [UIColor whiteColor];
        [fenLeiView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(changyong);
            make.width.mas_equalTo(Width/5+ 10);
            make.top.equalTo(changyong.mas_top).offset(20 +i *(20+2*((Width*4/5/4)-5)));
            make.height.mas_equalTo(((Width*4/5/4)-5)*2);
            
        }];
        UIImageView * imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor redColor];
        [fenLeiView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(fenLeiView.mas_left).offset(10);
            make.right.equalTo(fenLeiView.mas_right).offset(-10);
            make.height.mas_equalTo((Width/5-10));
            make.top.equalTo(fenLeiView.mas_top).offset(10 + 20);
        }];
        UILabel * fenLeiLabel = [[UILabel alloc] init];
        fenLeiLabel.text = [_fenLeiArray objectAtIndex:i];
        fenLeiLabel.textAlignment = NSTextAlignmentCenter;
        [fenLeiView addSubview:fenLeiLabel];
        [fenLeiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(fenLeiView);
            make.right.equalTo(fenLeiView);
            make.top.equalTo(imageView.mas_bottom);
            make.bottom.equalTo(fenLeiView);
        }];
        UIButton * fenLeiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        fenLeiBtn.tag = 20 + i;
        [fenLeiBtn addTarget:self action:@selector(fenLeiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [fenLeiView addSubview:fenLeiBtn];
        [fenLeiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(fenLeiView);
            make.right.equalTo(fenLeiView);
            make.top.equalTo(fenLeiView);
            make.bottom.equalTo(fenLeiView);
        }];
    }
    [self addcollectionView];
}
#pragma mark fenLeiBtnClick
-(void)fenLeiBtnClick:(UIButton *)btn
{
    if (btn.tag == 20)
    {
        NSLog(@"CRM");
    }
    else if (btn.tag ==21)
    {
        NSLog(@"采购");
    }
    else
    {
        NSLog(@"库存");
    }
    
}
#pragma mark entetDaoHangView
-(void)enterDaoHangView
{
    UIView * view1 = (UIView *)[self.view viewWithTag:10];
    [view1 removeFromSuperview];
    UIView * daoHangView = [[UIView alloc] init];
    daoHangView.tag = 10;
    daoHangView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:daoHangView];
    [daoHangView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(_searchBar.mas_bottom).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
    }];
    [self addcollectionView];
}
#pragma mark addSaoYiSaoBtn
-(void)addSaoYiSaoBtn
{
    UIButton * saoYiSaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [saoYiSaoBtn setBackgroundImage:<#(nullable UIImage *)#> forState:UIControlStateNormal];
    saoYiSaoBtn.backgroundColor = [UIColor redColor];
    [saoYiSaoBtn addTarget:self action:@selector(saoYiSaoBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:saoYiSaoBtn];
    [saoYiSaoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerView.mas_left).offset(10);
        make.top.equalTo(_headerView.mas_top).offset(5);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    UILabel * saoYiSaoLabel = [[UILabel alloc] init];
    saoYiSaoLabel.text = @"扫一扫";
    saoYiSaoLabel.font = [UIFont systemFontOfSize:12];
    [_headerView addSubview:saoYiSaoLabel];
    [saoYiSaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(saoYiSaoBtn.mas_bottom);
        make.bottom.equalTo(_headerView.mas_bottom);
        make.centerX.equalTo(saoYiSaoBtn);
    }];
    [saoYiSaoLabel sizeToFit];
}
#pragma mark saoYiSaoBtnClick
-(void)saoYiSaoBtnClick
{
    
}
#pragma mark addheaderView
-(void)addheaderView
{
    _headerView = [[UIView alloc] init];
    [self.view addSubview:_headerView];
    _headerView.backgroundColor = HEADER_VIEW_COLOR;
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
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
