//
//  AddPlayers.h
//  故事版
//
//  Created by dw on 16/10/15.
//  Copyright © 2016年 dw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "ChooseGame.h"
#import "ChooseRating.h"
@class AddPlayers;
@protocol AddPlayersDelegate <NSObject>

-(void) AddPlayersCancel:(AddPlayers *)controllers;
-(void) AddPlayersDone:(AddPlayers *)controllers andPlayer:(Player*)player;

@end
//@interface AddPlayers : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@interface AddPlayers : UITableViewController<ChooseRatingDelegate,
ChooseGameDelegate>
{
    //UITableView *_tableView;
    //UITextField *textField;
    NSArray *_array;
    UITextField *text1;
    UITextField *text2;
    UITextField *text3;
    UITextField *text4;
    UIImageView *imageView;
    NSString *game;
    UIImage *image;

}
@property(nonatomic,weak) id<AddPlayersDelegate> delegate;

@end
