//
//  ViewController.m
//  MultiTable
//
//  Created by viviwu on 15/8/30.
//  Copyright (c) 2015年 viviwu. All rights reserved.
//

#import "ViewController.h"
#import "multiCell.h"
#import "SecHeader.h"


#define KEY @"key"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * _sections;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title=@"tableModel";
    _sections=[NSMutableArray array];
    _tableView.tableFooterView=[[UIView alloc]init];
    //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"maincell"];
    [_tableView registerNib:[UINib nibWithNibName:@"multiCell" bundle:nil] forCellReuseIdentifier:@"multiCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"SecHeader" bundle:nil ] forHeaderFooterViewReuseIdentifier:@"SecHeader"];
    for (int s=0; s<5; s++)
    {
        secItem * sItem=[[secItem alloc]init];
        sItem.info=@"   TEL:10086";
        sItem.canOpen=arc4random()%2;//否则不能打开
        if (sItem.canOpen) {
            sItem.img=[UIImage imageNamed:@"msg"];
        }else{
            sItem.img=[UIImage imageNamed:@"ico"];
        }
        sItem.isOpen=NO;
        [_sections addObject:sItem];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark --UITableViewDataSource

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    SecHeader * header=[[[NSBundle mainBundle] loadNibNamed:@"SecHeader" owner:self options:nil] lastObject];
    secItem * item=_sections[section];
    SecHeader * header=[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SecHeader"];
    [header refreshData:item];
    header.tag=section;
    header.stateBTN.tag=section;
    header.blackBTN.tag=section+100;
    [header.blackBTN addTarget:self action:@selector(addToBlacklist:) forControlEvents:UIControlEventTouchUpInside];

    [header.stateBTN addTarget:self action:@selector(didChangeState:) forControlEvents:UIControlEventTouchUpInside];
    return header;
}
-(void)addToBlacklist:(UIButton*)btn
{
    NSLog(@"Section==%ld", (long)btn.tag);
}
- (void)didChangeState:(UIButton *)sender
{
    NSLog(@"Section==%ld", (long)sender.tag);
    secItem * sItem =_sections[sender.tag];
    if (sItem.canOpen) {
       sItem.isOpen=!sItem.isOpen;
    }
    //[self.tableView reloadData];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationFade];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0;
}
#pragma mark --UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    secItem * sItem =_sections[section];
    if (sItem.isOpen) {
        return 1;
    }else{
        return 0;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    multiCell * cell=[tableView dequeueReusableCellWithIdentifier:@"multiCell"];
//    cell.textLabel.text=[NSString stringWithFormat:@"(section:%ld, row:%ld)", (long)indexPath.section, (long)indexPath.row];
    [cell.rightBTN setTitle:[NSString stringWithFormat:@"%d",(int) indexPath.section*100+1] forState:UIControlStateNormal];
    [cell.leftBTN setTitle:[NSString stringWithFormat:@"%d",(int) indexPath.section*100+0] forState:UIControlStateNormal];
    cell.rightBTN.tag=100*indexPath.section+1;
    cell.leftBTN.tag=100*indexPath.section+0;
    [cell.rightBTN addTarget:self action:@selector(didClickRight:) forControlEvents:UIControlEventTouchUpInside ];
    [cell.leftBTN addTarget:self action:@selector(didClickLeft:) forControlEvents:UIControlEventTouchUpInside ];
    return cell;
}
-(void)didClickRight:(UIButton*)btn
{
    NSLog(@"didClick:%d", (int)btn.tag);
}
-(void)didClickLeft:(UIButton*)btn
{
    NSLog(@"didClick:%d", (int)btn.tag);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"(section:%ld, row:%ld)", (long)indexPath.section, (long)indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
