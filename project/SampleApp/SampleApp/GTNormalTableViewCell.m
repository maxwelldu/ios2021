//
//  GTNormalTableViewCell.m
//  SampleApp
//
//  Created by QTT on 2021/10/13.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell()

@property(nonatomic,strong, readwrite)UILabel *titleLabel;
@property(nonatomic,strong, readwrite)UILabel *sourceLabel;
@property(nonatomic,strong, readwrite)UILabel *commentLabel;
@property(nonatomic,strong, readwrite)UILabel *timeLabel;

@property(nonatomic,strong, readwrite)UIImageView *rightImageView;

@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 300, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 58, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 58, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 58, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(338, 15, 70, 70)];
            self.rightImageView;
        })];
    }
    return self;
}

- (void)layoutTableViewCell {
    self.titleLabel.text = @"极客时间iOS开发";
    
    self.sourceLabel.text = @"极客时间";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"1888评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x+self.sourceLabel.frame.size.width+15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = @"三分钟前";
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x+self.commentLabel.frame.size.width+15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    self.rightImageView.image = [UIImage imageNamed:@"icon.bundle/splash.png"];
}

@end
