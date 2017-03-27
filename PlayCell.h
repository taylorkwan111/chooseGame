//
//  PlayCell.h
//  故事版
//
//  Created by dw on 16/10/11.
//  Copyright © 2016年 dw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayCell : UITableViewCell

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *gameLabel;
@property (nonatomic,strong) UIImageView *imageView;


- (void)setLabel1Text:(NSString *)text1
           label2Text:(NSString *)text2
                image:(UIImage*)image;



@end
