//
//  ChooseGame.h
//  故事版
//
//  Created by dw on 16/10/23.
//  Copyright © 2016年 dw. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChooseGame;

@protocol ChooseGameDelegate <NSObject>

-(void) ChooseGameDelegate:(ChooseGame *)controller didSelectGame:(NSString*)Game;

@end
@interface ChooseGame : UITableViewController
{
    //NSArray *games;
}
@property (nonatomic,weak) id <ChooseGameDelegate>delegate;
@property(nonatomic,weak) NSString *game;
@end
