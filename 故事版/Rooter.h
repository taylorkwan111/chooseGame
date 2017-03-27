//
//  Rooter.h
//  故事版
//
//  Created by dw on 16/9/20.
//  Copyright © 2016年 dw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddPlayers.h"

@interface Rooter : UIViewController
<UITableViewDelegate,UITableViewDataSource,AddPlayersDelegate>
{
    UITableView *_tableView;
    NSMutableArray * _array;
    //NSMutableArray * players;
 
}
@property(nonatomic,strong) NSMutableArray *players;

@end
