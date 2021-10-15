//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by QTT on 2021/10/13.
//

#import "GTNormalTableViewCell.h"
#import "GTListItem.h"

@interface GTNormalTableViewCell()

@property(nonatomic,strong, readwrite)UILabel *titleLabel;
@property(nonatomic,strong, readwrite)UILabel *sourceLabel;
@property(nonatomic,strong, readwrite)UILabel *commentLabel;
@property(nonatomic,strong, readwrite)UILabel *timeLabel;

@property(nonatomic,strong, readwrite)UIImageView *rightImageView;
@property(nonatomic,strong, readwrite)UIButton *deleteButton;

@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 58, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 58, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 58, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel;
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 100, 70)];
            self.rightImageView;
        })];
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(278, 80, 30, 20)];
//            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
//
//            self.deleteButton.layer.cornerRadius = 10;
//            self.deleteButton.layer.masksToBounds = YES;
//            
//            self.deleteButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
//            self.deleteButton.layer.borderWidth = 2;
//            
//            self.deleteButton;
//        })];
    }
    return self;
}

- (void)layoutTableViewCellWithItem:(GTListItem *)item {
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniqueKey];
    if (hasRead) {
        self.titleLabel.textColor = [UIColor lightGrayColor];
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
    
    self.titleLabel.text = item.title;
    
    self.sourceLabel.text = item.authorName;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = item.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x+self.sourceLabel.frame.size.width+15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x+self.commentLabel.frame.size.width+15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    // 从网络中获取图片是高耗时的操作，不要直接在主线程执行，而是开启一个新的线程；不然会导致滚动的时候卡顿;
//    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        self.rightImageView.image = image;
//    }];
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];
    
    //GCD一个最基础的使用
    dispatch_queue_t downloadQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(downloadQueue, ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
        dispatch_async(mainQueue, ^{
            self.rightImageView.image = image;
        });
    });
}

- (void) deleteButtonClick {
    // 由于没有设置为必须实现，所以方法也判断一下是否可响应
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}

@end
