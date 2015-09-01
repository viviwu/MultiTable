//
//  SCRCell.m
//  MultiTable
//
//  Created by viviwu on 15/9/1.
//  Copyright (c) 2015年 viviwu. All rights reserved.
//

#import "SCRCell.h"

@implementation SCRCell

- (void)awakeFromNib {
    // Initialization code
    self.clipsToBounds=YES;
    self.layer.cornerRadius=15.0;
    self.contentView.clipsToBounds=YES;
    self.contentView.layer.cornerRadius=15.0;
    self.textLabel.clipsToBounds=YES;
    self.textLabel.layer.cornerRadius=15.0;
}

@end
