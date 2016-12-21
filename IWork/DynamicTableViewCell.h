//
//  DynamicTableViewCell.h
//  IWork
//
//  Created by sh-lx on 16/10/28.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicTableViewModel.h"


typedef void (^publishReiseOrPraise)(NSString*);
//图片点击
@protocol ImageDelegate <NSObject>

-(void)checkImage:(NSString*)imgname;

@end

//评论--点赞
@protocol ReviseDelegate <NSObject>

-(void)publishReiseOrPraise:(NSString*)method cellTag:(NSInteger)tag;

@end

@interface DynamicTableViewCell : UITableViewCell



@property (weak, nonatomic) id<ImageDelegate>myDelegate;

//
@property (copy ,nonatomic) publishReiseOrPraise myBlock;


@property (weak, nonatomic) id<ReviseDelegate> delegate;

@property (strong, nonatomic) DynamicTableViewModel *myModel;



@end
