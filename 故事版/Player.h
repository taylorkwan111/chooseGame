//
//  Player.h
//  故事版
//
//  Created by dw on 16/10/9.
//  Copyright © 2016年 dw. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface Player : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy) NSString *game;
@property (nonatomic,strong) UIImage *image;

@end
