//
//  Study0ViewController.m
//  YKloveEdu
//
//  Created by yangmei on 15/3/27.
//  Copyright (c) 2015年 yangmei. All rights reserved.
//

#import "Study0ViewController.h"
#import "Study0ViewCell.h"

@interface Study0ViewController () <UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSArray *study0Array;
@property (weak, nonatomic) IBOutlet UICollectionView *collView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@end

@implementation Study0ViewController

- (NSArray *)study0Array
{
    if (!_study0Array) {
        _study0Array = [NSArray array];
    }
    return _study0Array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"学习";
    _layout.itemSize = CGSizeMake(kScreenWidth / 3 - 5, 70);
    self.collView.dataSource = self;
    self.collView.delegate = self;
    self.collView.showsVerticalScrollIndicator = NO;
    [_collView registerClass:[Study0ViewCell class] forCellWithReuseIdentifier:@"study0"];
}

#pragma mark-coll delegate
#pragma mark - 数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Study0ViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"study0" forIndexPath:indexPath];
    cell.headImage.image = [UIImage imageNamed:@"study1"];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YMLog(@"%ld",indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
