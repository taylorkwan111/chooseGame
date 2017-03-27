//
//  PlayCell.m
//  故事版
//
//  Created by dw on 16/10/11.
//  Copyright © 2016年 dw. All rights reserved.
//

#import "PlayCell.h"
#import "AppDelegate.h"
#import "Player.h"
#import "Rooter.h"

@implementation PlayCell

@synthesize nameLabel;
@synthesize gameLabel;
@synthesize imageView;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 80, 30)];
        //nameLabel.text = @"111111111";
        [self.contentView addSubview:nameLabel];
        
        gameLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 30, 80, 30)];
        //gameLabel.text = @"111111111";
        [self.contentView addSubview:gameLabel];
        
        imageView=[[UIImageView alloc]initWithFrame:CGRectMake(200, 30, 81, 15 )];
        //ratingImageView=[[UIImage alloc]init];
        //imageView.image=ratingImageView;
        [self.contentView addSubview:imageView];
        
    }
    return self;
}
- (void)setLabel1Text:(NSString *)text1
           label2Text:(NSString *)text2
            image:(UIImage *) image;
{
    nameLabel.text = text1;
    gameLabel.text = text2;
    imageView.image=image;
}

- (void)dealloc
{
    gameLabel=nil;
    nameLabel=nil;
    
}

@end
