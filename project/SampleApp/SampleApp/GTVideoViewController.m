//
//  GTVideoViewController.m
//  SampleApp
//
//  Created by QTT on 2021/10/13.
//

#import "GTVideoViewController.h"

@interface GTVideoViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation GTVideoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    // 复杂的时候自定义cell, 继承自UICollectionViewCell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
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
