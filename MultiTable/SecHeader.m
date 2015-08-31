//
//  SecHeader.m
//  MultiTable
//
//  Created by viviwu on 15/8/30.
//  Copyright (c) 2015年 viviwu. All rights reserved.
//

#import "SecHeader.h"

@implementation secItem

@end

@interface SecHeader()
@end

@implementation SecHeader

-(void)awakeFromNib
{
    NSLog(@"%s", __FUNCTION__);
    _imgView.clipsToBounds=YES;
    _imgView.layer.cornerRadius=5.0;
    _blackBTN.clipsToBounds=YES;
    _blackBTN.layer.cornerRadius=5.0;
}

-(void)refreshData:(secItem*)item
{
    if (_imgView.image) {
        _imgView.image=item.img;
    }
    _label.text=item.info;
}

- (void)setNeedsDisplay
{
    
}
- (IBAction)didChangeState:(UIButton *)sender {
    NSLog(@"%ld", (long)sender.tag);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
