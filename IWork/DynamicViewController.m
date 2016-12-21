//
//  DynamicViewController.m
//  IWork
//
//  Created by sh-lx on 16/10/25.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "DynamicViewController.h"
#import "Header.h"
#import "ZTopView.h"
#import <Masonry.h>
#import "DynamicTableViewCell.h"
#import "DynamicTableViewModel.h"


@interface DynamicViewController ()<ImageDelegate,ReviseDelegate,UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) NSMutableArray *dataArray;

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation DynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArray = [NSMutableArray arrayWithCapacity:20];
    
    NSArray *imgArray = @[@"asd,asd,asd,asd"];
    NSArray *content = @[@"十四年之后再重看《东邪西毒》（编注：写于2008年），不只我看懂了，其他人也看懂了。不知道是不是王家卫的思想领先了我们整整十四年？"];
    for (NSInteger i=0; i<4; i++) {
        DynamicTableViewModel *model = [[DynamicTableViewModel alloc]init];
        model.name = @"景甜";
        model.headImg = @"asd";
        model.reviewStr = @"黎明:东西吸毒算什么，还有南帝北丐呢";
        model.trends = content[0];
        model.contentImgs = imgArray[0];
        [self.dataArray addObject:model];
    }

    
    // add topView
    [self adTopView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, Width, Height-64) style:(UITableViewStyleGrouped)];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
    
    
}
#pragma mark   UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier0 = @"identifier0";
    DynamicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier0];
    if (!cell) {
        cell = [[DynamicTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier0];
    }
    //cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.tag = indexPath.row;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    DynamicTableViewModel *model = self.dataArray[indexPath.row];
    cell.myModel = model;
    cell.myDelegate = self;
    cell.delegate = self;
    
    [cell setMyModel:model];
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 180.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger width = Width - 30;
    DynamicTableViewModel *model = self.dataArray[indexPath.row];
    NSString *contentText = model.trends;
    NSInteger H = 108;
    //    计算文字高度
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12]};
    CGSize size = [contentText boundingRectWithSize:CGSizeMake(width, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    //    计算图片高度
    NSInteger imgH;
    if (model.contentImgs.length == 0) {
        imgH = 15;
    }else{
        NSInteger imgcount = [model.contentImgs componentsSeparatedByString:@","].count;
        imgH = (kSpace+imgWidth)*(imgcount/4+1);
    }
    
    return H + size.height + imgH ;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 180)];
        view.backgroundColor = [UIColor redColor];
        UIImageView *imageView1 = [[UIImageView alloc]init];
        imageView1.backgroundColor = [UIColor grayColor];
        [view addSubview:imageView1];
        
        [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view);
            make.right.equalTo(view);
            make.top.equalTo(view);
            make.bottom.equalTo(view).offset(-20);
        }];
        
        UIImageView *headImageView = [[UIImageView alloc]init];
        headImageView.backgroundColor = [UIColor yellowColor];
        
        headImageView.layer.masksToBounds=YES;
        headImageView.layer.cornerRadius=60/2.0f; //设置为图片宽度的一半出来为圆形
        headImageView.layer.borderWidth=3.0f; //边框宽度
        headImageView.layer.borderColor=[[UIColor whiteColor] CGColor];
        [view addSubview:headImageView];
        
        [headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(view).offset(-10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
            make.bottom.equalTo(view);
        }];
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.backgroundColor = RGBA(245, 245, 245, 1);
        nameLabel.textAlignment = 2;
        [view addSubview: nameLabel];
        nameLabel.text = @"sb";
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(headImageView.mas_left).offset(-10);
            make.bottom.equalTo(imageView1.mas_bottom);
            make.width.mas_equalTo(180);
            make.height.mas_equalTo(20);
            
        }];
        
        
        
        return view;
    }else{
        return nil;
    }
}





/*
 *添加顶部视图
 */
-(void)adTopView
{
    ZTopView *topView = [[ZTopView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    topView.titleLabel.text = @"动态";
    //    topView.backgroundColor = [UIColor redColor];
    topView.userInteractionEnabled = YES;
    [self.view addSubview:topView];
    
    UIButton *rightBtn = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    rightBtn.frame = CGRectMake(Width-44, 20, 44, 44);
    //rightBtn.imageView.image = [UIImage imageNamed:@"1.png"];
    //[rightBtn setTitle:@"发动态" forState:(UIControlStateNormal)];
    
    UIImage *image = [UIImage imageNamed:@"asd.png"];
    
    image =[image imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    
    [rightBtn setImage:image forState:UIControlStateNormal];//给button添加image
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(5,5,5,5);
    
    [rightBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.view addSubview:rightBtn];
    [rightBtn addTarget:self action:@selector(rightBtnClicked) forControlEvents:(UIControlEventTouchUpInside)];

}
-(void)rightBtnClicked
{
    NSLog(@"发动态");
}

//点赞----评论
-(void)publishReiseOrPraise:(NSString *)method cellTag:(NSInteger)tag{
    
    if ([method isEqualToString:@"comment"]) {
        
        NSLog(@"评论%ld",(long)tag);
        
    }else if ([method isEqualToString:@"lianXi"]){
        NSLog(@"联系%ld",(long)tag);
    }else{
        
        NSLog(@"点赞%ld",(long)tag);
    }
    
}

//图片方法
-(void)checkImage:(NSString *)imgname{
    
    self.navigationController.navigationBar.alpha = 0;
    self.tableView.scrollEnabled = NO;
    UIImageView *bgImage = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bgImage.image = [UIImage imageNamed:imgname];
    bgImage.contentMode = UIViewContentModeScaleToFill;
    bgImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [bgImage addGestureRecognizer:tap];
    [self.view addSubview:bgImage];
}

//图片点击事件
-(void)tapClick:(UITapGestureRecognizer*)tap{
    
    self.navigationController.navigationBar.alpha = 1;
    self.tableView.scrollEnabled = YES;
    [tap.view removeFromSuperview];
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
