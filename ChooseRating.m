//
//  ChooseRating.m
//  故事版
//
//  Created by dw on 16/10/25.
//  Copyright © 2016年 dw. All rights reserved.
//

#import "ChooseRating.h"

@interface ChooseRating ()
{
    NSArray *images;
   // NSInteger selectedIndex;
}

@end

@implementation ChooseRating

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    UIPickerView * pk=[[UIPickerView alloc]init];
    pk.frame=CGRectMake(0, 150, 320, 200);
   

    
    [pk setShowsSelectionIndicator:YES];
    pk.delegate=self;
    pk.dataSource=self;
    
    [self.view addSubview:pk];
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 5;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [images objectAtIndex:row];
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}
//可以将自定义的视图显示到屏幕上
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImage *imageshow=[UIImage imageNamed:[NSString stringWithFormat:@"%ldStarsSmall",row+1]];
    UIImageView *viewshow=[[UIImageView alloc]initWithImage:imageshow];
    return viewshow;
    
    //[self.delegate sendrating:image];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString  *str=[NSString stringWithFormat:@"%ldStarsSmall.png",row+1];
    UIImage *image=[UIImage imageNamed:str];
    [self.delegate sendrating:image];
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
