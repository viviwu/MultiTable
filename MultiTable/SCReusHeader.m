//
//  SCReusHeader.m
//  MultiTable
//
//  Created by viviwu on 15/9/1.
//  Copyright (c) 2015年 viviwu. All rights reserved.
//

#import "SCReusHeader.h"

@implementation SCReusHeader

-(void)refreshData:(secItem*)item
{
    if (_imgView.image) {
        _imgView.image=item.img;
    }
    _label.text=item.info;
}


- (void)awakeFromNib {
    // Initialization code
    NSLog(@"%s", __FUNCTION__);
    _imgView.clipsToBounds=YES;
    _imgView.layer.cornerRadius=5.0;
    _blackBTN.clipsToBounds=YES;
    _blackBTN.layer.cornerRadius=5.0;

}

@end
