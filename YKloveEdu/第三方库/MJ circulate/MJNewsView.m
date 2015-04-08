//
//  MJNewsView.m
//  预习-03-无限滚动
//
//  Created by MJ Lee on 14-5-30.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

// 每一组最大的行数
#define MJNewsTotalRowsInSection (5000 * self.newses.count)
#define MJNewsDefaultRow (NSUInteger)(MJNewsTotalRowsInSection * 0.5)

#import "MJNewsView.h"
#import "MJNewsCell.h"

@interface MJNewsView()  <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) NSTimer *timer;
@end

@implementation MJNewsView
+ (instancetype)newsView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"MJNewsView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib
{
    [self.collectionView registerNib:[UINib nibWithNibName:@"MJNewsCell" bundle:nil] forCellWithReuseIdentifier:@"news"];
    _layout.itemSize = CGSizeMake(kScreenWidth, 130);
    [self addTimer];
}

- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(nextNews) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)nextNews
{
    NSIndexPath *visiablePath = [[self.collectionView indexPathsForVisibleItems] firstObject];
    
    NSUInteger visiableItem = visiablePath.item;
    if ((visiablePath.item % self.newses.count)  == 0) { // 第0张图片
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:MJNewsDefaultRow inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        visiableItem = MJNewsDefaultRow;
    }
    
    NSUInteger nextItem = visiableItem + 1;
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextItem inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (void)setNewses:(NSArray *)newses
{
    _newses = newses;
    
    // 总页数
    self.pageControl.numberOfPages = self.newses.count;
    
    // 刷新数据
    [self.collectionView reloadData];
    
    // 默认组
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:MJNewsDefaultRow inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}

#pragma mark - 数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return MJNewsTotalRowsInSection;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"news";
    MJNewsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.news = self.newses[indexPath.item % self.newses.count];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *visiablePath = [[collectionView indexPathsForVisibleItems] firstObject];
    self.pageControl.currentPage = visiablePath.item % self.newses.count;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self addTimer];
}

@end
