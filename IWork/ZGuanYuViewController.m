//
//  ZGuanYuViewController.m
//  IWork
//
//  Created by sh-lx on 16/10/28.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import "ZGuanYuViewController.h"

@interface ZGuanYuViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftBarButton;

@end

@implementation ZGuanYuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)back:(id)sender {
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
