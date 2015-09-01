//
//  useless.h
//  MultiTable
//
//  Created by viviwu on 15/9/1.
//  Copyright (c) 2015年 viviwu. All rights reserved.
//

#ifndef MultiTable_useless_h
#define MultiTable_useless_h


#endif
//
//  ViewC.m
//  LessonUICollectionView
//
//  Created by lanouhn on 14-9-16.
//  Copyright (c) 2014年 vaercly@163.com 陈聪雷. All rights reserved.
//

#import "ViewC.h"
#import "CLCollectionViewCell.h"
#import "HeadView.h"
#import "FootView.h"
static NSString *cellIdentifier = @"cell";
static NSString *headerIdentifier = @"header";
static NSString *footerIdentifier = @"footer";
@interface ViewC ()<uicollectionviewdatasource, uicollectionviewdelegate,="" uicollectionviewdelegateflowlayout="">

@end

@implementation ViewC


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;//滚动方向
    flowLayout.minimumLineSpacing = 10.0;//行间距(最小值)
    flowLayout.minimumInteritemSpacing = 50.0;//item间距(最小值)
    flowLayout.itemSize = CGSizeMake(50, 50);//item的大小
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);//设置section的边距
    flowLayout.headerReferenceSize = CGSizeMake(320, 20);
    flowLayout.footerReferenceSize = CGSizeMake(320, 20);
    //第二个参数是cell的布局
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 568) collectionViewLayout:flowLayout];
    [flowLayout release];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor orangeColor];
    //1 注册复用cell(cell的类型和标识符)(可以注册多个复用cell, 一定要保证重用标示符是不一样的)注册到了collectionView的复用池里
    [collectionView registerClass:[CLCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    
    //第一个参数:返回的View类型
    //第二个参数:设置View的种类(header, footer)
    //第三个参数:设置重用标识符
    [collectionView registerClass:[HeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIdentifier];
    [collectionView registerClass:[FootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIdentifier];
    [self.view addSubview:collectionView];
    [collectionView release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //2 从复用池中找cell(1:cell的标示符 2:indexPath决定系统用不用再给你创建cell, 不用创建的话, 就直接使用之前的cell)
    CLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        HeadView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
        headerView.textLabel.text = @"让我组成头部!";
        headerView.textLabel.textAlignment = NSTextAlignmentCenter;
        headerView.textLabel.textColor = [UIColor whiteColor];
        return headerView;
    }
    FootView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerIdentifier forIndexPath:indexPath];
    footerView.textLabel.text = @"让我组成尾部!";
    footerView.textLabel.textAlignment = NSTextAlignmentCenter;
    footerView.textLabel.textColor = [UIColor whiteColor];
    return footerView;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d %d", indexPath.section, indexPath.row);
}

#pragma mark - UICollectionViewDelegateFlowLayout
/*
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
 {
 }
 - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
 {
 
 }
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
 {
 
 }
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
 {
 
 }
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
 {
 
 }
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
 {
 
 }
 */
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
</uicollectionviewdatasource,>