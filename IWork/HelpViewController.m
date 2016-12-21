//
//  HelpViewController.m
//  IWork
//
//  Created by sh-lx on 16/10/26.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "HelpViewController.h"
#import "ZTopView.h"
#import "Header.h"
#import "CLCycleView.h"
#import "jingXuanCollectionViewCell.h"
#import <Masonry.h>



@interface HelpViewController ()<CLCycleViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong) CLCycleView *cycleView;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *titleArray1;



@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _titleArray1  = @[@"应用指南",@"培训视频",@"价格购买",@"关于我们",@"意见反馈"];
    
    
    /*
     *顶部view
     */
    [self addTopView];
    
    
    /*
     *添加图片轮播
     */
    [self addPhotoLunBo ];
    
    
    
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    //    layout.itemSize = CGSizeMake(Width/4, Width/4);
    layout.minimumInteritemSpacing =10;
    layout.minimumLineSpacing = 1; //上下的间距 可以设置0看下效果
    
        layout.minimumLineSpacing = 10;
   
    layout.sectionInset = UIEdgeInsetsMake(10.f, 0, 9.f, 0);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[jingXuanCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(_cycleView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view);
    }];
   
    
    
    
    

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

#pragma mark  CollectionView代理
#pragma mark  collectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
            return 1;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
           return 5;
    
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
   
    cell.titleLabel.text = [_titleArray1 objectAtIndex:indexPath.item];
   
    
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
   
        float width = Width;
        float height = 0;
        return CGSizeMake(width, height);
   
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
        return CGSizeMake(Width/3-1, Width/3-0.5);
   
    
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
   
        return UIEdgeInsetsMake(0, 5, 5,5);
   
}

//定义每个UICollectionView 的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}



/*
 *顶部view
 */
-(void)addTopView
{
    ZTopView *topView = [[ZTopView alloc]initWithFrame:CGRectMake(0, 0, Width, 64)];
    topView.titleLabel.text = @"帮助中心";
    [self.view addSubview:topView];
    
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    backBtn.frame = CGRectMake(0, 20, 44, 44);
    [backBtn setTitle:@"返回" forState:(UIControlStateNormal)];
    [backBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [topView addSubview:backBtn];
    [backBtn addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
}

/*
 *添加图片轮播
 */
-(void)addPhotoLunBo
{
    CGRect frame = CGRectMake(0, 64, Width, 200);
    NSArray *imageArr = @[@"1.jpg",@"2.png",@"3.jpg",@"4.jpg"];
    CLCycleView *cycleView = [[CLCycleView alloc] initWithFrame:frame duration:3 imageArr:imageArr];
    cycleView.delegate = self;
    cycleView.currentPageIndicatorTintColor = [UIColor redColor];
    cycleView.pageIndicatorTintColor = [UIColor blueColor];
    cycleView.diameter = 20;
    
    cycleView.cycleView = ^(NSInteger indexPage) {
        NSLog(@"block显示点击%ld张图片",(long)indexPage);
    };
    
    self.cycleView = cycleView;
    [self.view addSubview:cycleView];
}

#pragma mark - cycleViewDelegate图片轮播代理点击图片
- (void)cycleViewDidSelected:(NSInteger)pageIndex {
    
    NSLog(@"delegate显示点击%ld张图片",(long)pageIndex);
//    [self.cycleView stop];
    
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
