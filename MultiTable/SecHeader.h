//
//  SecHeader.h
//  MultiTable
//
//  Created by viviwu on 15/8/30.
//  Copyright (c) 2015年 viviwu. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface secItem : NSObject
@property(nonatomic,assign)BOOL canOpen;
@property(nonatomic,assign)BOOL isOpen;
@property(nonatomic,strong)UIImage * img;
@property(nonatomic,strong)NSString * info;

@end

@interface SecHeader : UITableViewHeaderFooterView

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *stateBTN;
@property (weak, nonatomic) IBOutlet UIButton *blackBTN;

-(void)refreshData:(secItem*)item;

@end
