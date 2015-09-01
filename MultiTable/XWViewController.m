//
//  XWViewController.m
//  MultiTable
//
//  Created by viviwu on 15/9/1.
//  Copyright (c) 2015年 viviwu. All rights reserved.
//

#import "XWViewController.h"
#import "SCReusHeader.h"
#import "SCRCell.h"

@interface XWViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray * _sections;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation XWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"collectionModel";
    _sections=[NSMutableArray array];
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

    if (_collectionView) {
        NSLog(@"_collectionView==============");
    }
    [_collectionView registerNib:[UINib nibWithNibName:@"SCRCell" bundle:nil] forCellWithReuseIdentifier:@"collection"];
    [_collectionView registerNib:[UINib nibWithNibName:@"SCReusHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SCRHeader"];//用Header复用
    [_collectionView reloadData];
    // Do any additional setup after loading the view from its nib.
    
}

#pragma mark--UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _sections.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    secItem * sItem =_sections[section];
    if (sItem.isOpen) {
        return 3;
    }else{
        return 0;
    }
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SCRCell * cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"collection" forIndexPath:indexPath];
    if (indexPath.row==0) {
        cell.textLabel.text=@"免费通话";
    }else if(indexPath.row==1){
        cell.textLabel.text=@"Q聊外呼";
        cell.contentView.backgroundColor=[UIColor redColor];
    }else if(indexPath.row==2){
        cell.textLabel.text=@"免费信息";
        cell.contentView.backgroundColor=[UIColor greenColor];
    }
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    secItem * item=_sections[indexPath.section];
    SCReusHeader *header=nil;
    if (kind==UICollectionElementKindSectionHeader) {
        header=[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SCRHeader" forIndexPath:indexPath];
        [header refreshData:item];
        header.tag=indexPath.section;
        header.stateBTN.tag=indexPath.section;
        header.blackBTN.tag=indexPath.section+100;
        [header.blackBTN addTarget:self action:@selector(addToBlacklist:) forControlEvents:UIControlEventTouchUpInside];
        
        [header.stateBTN addTarget:self action:@selector(didChangeState:) forControlEvents:UIControlEventTouchUpInside];
    }
    
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
    [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag]];
}

#pragma mark--UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"(section:%ld, row:%ld)", (long)indexPath.section, (long)indexPath.row);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
