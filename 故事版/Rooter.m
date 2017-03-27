//
//  Rooter.m
//  故事版
//
//  Created by dw on 16/9/20.
//  Copyright © 2016年 dw. All rights reserved.
//
#import "Player.h"
#import "Rooter.h"
#import "AppDelegate.h"
#import "PlayCell.h"
#import "AddPlayers.h"

@interface Rooter ()

@end

@implementation Rooter

-(void)loadView
{
    self.title=@"Players";
    UIView *view=[[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view=view;
    view=nil;
    
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 560) style:UITableViewStylePlain];
    //    _tableView.autoresizingMask=UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //PlayCell的位置摆放
//    PlayCell *playcell=[[PlayCell alloc]init];
//    UILabel *nameLable=[[UILabel alloc]initWithFrame:CGRectMake(0,0,80, 20)];
//    [self.view addSubview:nameLable];
//    UILabel *gameLabel=[[UILabel  alloc]initWithFrame:CGRectMake(0, 30, 80, 20)];
//    [self.view addSubview:gameLabel];
//    UIImageView *ratingImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 80, 40)];
//    [self.view addSubview:ratingImageView];
//    nameLable=playcell.nameLabel;
//    gameLabel=playcell.gameLabel;
//    ratingImageView=playcell.ratingImageView;
    
    // Do any additional setup after loading the view.
   
    //PlayCell *playcell=[[PlayCell alloc]init];
    
    UIBarButtonItem *btnDelete=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pressLeft)];
    self.navigationItem.rightBarButtonItem=btnDelete;

}
-(void)pressLeft
{
    AddPlayers *ap=[[AddPlayers alloc]init];
    
    ap.delegate=self;
    //[self presentViewController:ap animated:YES completion:nil];
    [self.navigationController pushViewController:ap animated:YES];
//    UIBarButtonItem *btnDelete=[[UIBarButtonItem alloc]initWithTitle:@"delete" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
//     self.navigationItem.rightBarButtonItem=btnDelete;
}
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //删除数据源对应的数据
//    [_array removeObjectAtIndex:indexPath.row];
//    //数据源更新
//    [_tableView reloadData];
//}

//- (UIImage *)imageForRating:(int)rating
//{
//    switch (rating) {
//        case 1:
//            return [UIImage imageNamed:@"1StarsSmall.png"];
//        case 2:
//            return [UIImage imageNamed:@"2StarsSmall.png"];
//        case 3:
//            return [UIImage imageNamed:@"3StarsSmall.png"];
//        case 5:
//            return [UIImage imageNamed:@"4StarsSmall.png"];
//    }
//    return nil;
//}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.players.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str=@"cell";
    PlayCell *cell=[_tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[PlayCell alloc]initWithStyle:UITableViewCellStyleSubtitle   reuseIdentifier:str];
    }
    Player *player=[self.players objectAtIndex:indexPath.row];
//    cell.textLabel.text=player.name;
//    cell.detailTextLabel.text=player.game;
//    cell.ratingImageView.image=[self imageForRating:player.rating];
    //UIImageView *imageView=[[UIImageView alloc]init];
    //imageView.image=[self imageForRating:player.rating];
 
    [cell setLabel1Text:player.name  label2Text:player.game image:player.image];

    return cell;
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete)
    {
        [self.players removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(void)AddPlayersCancel:(AddPlayers *)controllers
{
    //AddPlayers *send=[[AddPlayers alloc]init];
    //send.delegate=self;
    //[self.navigationController popToRootViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}
-(void)AddPlayersDone:(AddPlayers *)controllers andPlayer:(Player *)player
{
    [self.players addObject:player];
    NSIndexPath *indexPath =
    [NSIndexPath indexPathForRow:[self.players count] - 1
                       inSection:0];
    [_tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
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
