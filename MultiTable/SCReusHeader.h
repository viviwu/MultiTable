//
//  SCReusHeader.h
//  MultiTable
//
//  Created by viviwu on 15/9/1.
//  Copyright (c) 2015年 viviwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecHeader.h"

@interface SCReusHeader : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *stateBTN;
@property (weak, nonatomic) IBOutlet UIButton *blackBTN;
-(void)refreshData:(secItem*)item;

@end
