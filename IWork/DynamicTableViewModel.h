//
//  DynamicTableViewModel.h
//  IWork
//
//  Created by sh-lx on 16/10/28.
//  Copyright © 2016年 sh-lx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicTableViewModel : NSObject

@property (copy ,nonatomic) NSString *name;//名字
@property (copy ,nonatomic) NSString *trends;//发表的内容
@property (copy ,nonatomic) NSString *headImg;//头像
@property (copy ,nonatomic) NSString *contentImgs;//发表的图片
@property (copy ,nonatomic) NSString *reviewStr;//评论

@end
