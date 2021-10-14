//
//  GTNewsViewController.m
//  SampleApp
//
//  Created by QTT on 2021/10/13.
//

#import "GTNewsViewController.h"
#import "GTNormalTableViewCell.h"
#import "GTDetailViewController.h"
#import "GTDeleteCellView.h"
#import "GTListLoader.h"
#import "GTListItem.h"

@interface GTNewsViewController ()<UITableViewDataSource, UITableViewDelegate, GTNormalTableViewCellDelegate>
@property(nonatomic, strong, readwrite)UITableView *tableView;
@property(nonatomic, strong, readwrite)NSArray *dataArray; //使用不可变的数组，避免数据的变化对TableView的刷新
@property(nonatomic, strong, readwrite)GTListLoader *listLoader;

@end

@implementation GTNewsViewController

#pragma mark - life cycle

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    self.listLoader = [[GTListLoader alloc] init];
    __weak typeof(self)wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<GTListItem *> * _Nonnull dataArray) {
        __strong typeof(self)strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GTListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    GTDetailViewController *vc = [[GTDetailViewController alloc] initWithUrlString:item.articleUrl];
    vc.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    [self.navigationController pushViewController:vc animated:YES];
}

// 父组件的delegate也可以实现
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"scroll");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 复用回收池中获取
    GTNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[GTNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    cell.delegate = self;
    
    
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
//    GTDeleteCellView *view = [[GTDeleteCellView alloc] initWithFrame:self.view.bounds];
//
//    // 将cell的坐标系转换为整个窗口的坐标系
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//
//    // 因为是block, 处理一下循环引用的问题
//    __weak typeof(self)wself = self;
//    [view showDeleteViewFromPoint:rect.origin clickBlock:^{
//        __strong typeof(self)strongSelf = wself;
//        // 删除的同时将对应的数据也进行删除，现在的数组类型不符合规范，临时使用一下；这里删除最后一个元素是保证个数能对的上，后面再删除真实的
//        [strongSelf.dataArray removeLastObject];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:(UITableViewRowAnimationAutomatic)];
//    }];
}

@end
