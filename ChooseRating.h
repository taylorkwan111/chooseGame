//
//  ChooseRating.h
//  故事版
//
//  Created by dw on 16/10/25.
//  Copyright © 2016年 dw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChooseRating;

@protocol ChooseRatingDelegate <NSObject>

-(void) sendrating:(UIImage*) image;

@end
@interface ChooseRating : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
{
  // UIPickerView *pk;
}
@property (nonatomic,strong) id<ChooseRatingDelegate>delegate;
@property (nonatomic,copy) UIImage *image;
//@property(nonatomic,copy)UIPickerView *pk;
@end
