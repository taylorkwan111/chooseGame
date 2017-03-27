//
//  AddPlayers.m
//  故事版
//
//  Created by dw on 16/10/15.
//  Copyright © 2016年 dw. All rights reserved.
//

#import "AddPlayers.h"
#import "Player.h"
#import "Rooter.h"
#import "ChooseGame.h"
#import "ChooseRating.h"

@interface AddPlayers ()

@end

@implementation AddPlayers

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self=[super initWithCoder:aDecoder]))
    {
        
        NSLog(@"init ChooseGame");
        game = @"Chess";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Add Players";
    UIBarButtonItem *btnCancel=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(pressCancel)];
    self.navigationItem.leftBarButtonItem=btnCancel;
    
    
    UIBarButtonItem *btnDone=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pressDone)];
    self.navigationItem.rightBarButtonItem=btnDone;
    
    game = @"Chess";
   
    image=[UIImage imageNamed:[NSString stringWithFormat:@"1StarsSmall.png"]];
    
}
//-(void) AddPlayersCancel:(AddPlayers *)controllers
//{
//    
//     [self.delegate AddPlayersCancel:self];
//}

-(void)pressCancel
{
    [self.delegate AddPlayersCancel:self];
    [self.navigationController popToRootViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
}
-(void)pressDone
{
    Player *player=[[Player alloc]init];
    player.name=text1.text;
    player.game=game;
    player.image=image;
    [self.delegate AddPlayersDone:self andPlayer:player];
    //[self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)ChooseGameDelegate:(ChooseGame *)controller didSelectGame:(NSString *)Game
{
    game=Game;
    text3.text=game;
    //[self.navigationController popViewControllerAnimated:YES];
}
-(void)sendrating:(UIImage *)Image
{
    image=Image;
    imageView.image=image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * str=@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
   
    switch (indexPath.section) {
        case 0:
            //cell.textLabel.text = @"0";
        {
            text1 = [[UITextField alloc] initWithFrame:CGRectMake(15, 5, 260, 30)];
            text1.backgroundColor = [UIColor whiteColor];
            text1.borderStyle=UITextBorderStyleRoundedRect;
            text1.text = @"";
            [cell.contentView addSubview:text1];
        }
            break;
        case 1:
        {
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            text2=[[UITextField alloc]initWithFrame:CGRectMake(15, 5, 80, 30)];
            text2.borderStyle=UITextBorderStyleNone;
            text2.text=@"Game";
            text2.enabled=NO;
            [cell.contentView addSubview:text2];
            
            text3=[[UITextField alloc]initWithFrame:CGRectMake(230, 5, 50, 30)];
            text3.borderStyle=UITextBorderStyleNone;
            text3.text=game;
            text3.textColor=[UIColor blueColor];
            text3.enabled=NO;
            [cell.contentView addSubview:text3];

        }
            break;
            case 2:
        {
            text4=[[UITextField alloc]initWithFrame:CGRectMake(15, 5, 80, 30)];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            text4.borderStyle=UITextBorderStyleNone;
            text4.text=@"Rating";
            text4.enabled=NO;
            [cell.contentView addSubview:text4];
            
        
            imageView=[[UIImageView alloc]init];
            imageView.frame=CGRectMake(180, 7, 100, 18);
            imageView.image=image;
            //imageView.backgroundColor=[UIColor blackColor];
            [cell.contentView addSubview:imageView];
            
        }
        default:
            break;
    }
    return cell;

}

    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return @"Players Name";
    }
    if (section==1)
    {
        return @"Game";
    }
    else
    {
        return @"Rating";
    }
   
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if (section==0)
    {
        return @"PN";
    }
    if (section==1)
    {
        return @"G";
    }
    else
    {
        return @"R";
    }

}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (indexPath.section==1)
    {
        ChooseGame *cg=[[ChooseGame alloc]init];
        cg.delegate=self;
        cg.game=game;
        [self.navigationController pushViewController:cg animated:YES];
    }
    if (indexPath.section==2)
    {
        ChooseRating *cr=[[ChooseRating alloc]init];
        cr.delegate=self;
        cr.image=image;
        [self.navigationController pushViewController:cr animated:YES];
    }
//    ChooseGame *cg=[[ChooseGame alloc]init];
//    cg.delegate=self;
//    cg.game=game;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
