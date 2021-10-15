//
//  GTVideoToolbar.m
//  SampleApp
//
//  Created by QTT on 2021/10/15.
//

#import "GTVideoToolbar.h"

@interface GTVideoToolbar ()
@property(nonatomic, strong, readwrite)UIImageView *avatarImageView;
@property(nonatomic, strong, readwrite)UILabel *nickLabel;

@property(nonatomic, strong, readwrite)UIImageView *commentImageView;
@property(nonatomic, strong, readwrite)UILabel *commentLabel;

@property(nonatomic, strong, readwrite)UIImageView *likeImageView;
@property(nonatomic, strong, readwrite)UILabel *likeLabel;

@property(nonatomic, strong, readwrite)UIImageView *shareImageView;
@property(nonatomic, strong, readwrite)UILabel *shareLabel;

@end

@implementation GTVideoToolbar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:({
            _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _avatarImageView.layer.masksToBounds = YES;
            _avatarImageView.layer.cornerRadius = 15;
            _avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
            
            _avatarImageView;
        })];
        [self addSubview:({
            _nickLabel = [[UILabel alloc] init];
            _nickLabel.font = [UIFont systemFontOfSize:15];
            _nickLabel.textColor = [UIColor lightGrayColor];
            _nickLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _nickLabel;
        })];
        
        [self addSubview:({
            _commentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _commentImageView.layer.masksToBounds = YES;
            _commentImageView.layer.cornerRadius = 15;
            _commentImageView.translatesAutoresizingMaskIntoConstraints = NO;
            
            _commentImageView;
        })];
        [self addSubview:({
            _commentLabel = [[UILabel alloc] init];
            _commentLabel.font = [UIFont systemFontOfSize:15];
            _commentLabel.textColor = [UIColor lightGrayColor];
            _commentLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _commentLabel;
        })];
        
        [self addSubview:({
            _likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _likeImageView.layer.masksToBounds = YES;
            _likeImageView.layer.cornerRadius = 15;
            _likeImageView.translatesAutoresizingMaskIntoConstraints = NO;
            
            _likeImageView;
        })];
        [self addSubview:({
            _likeLabel = [[UILabel alloc] init];
            _likeLabel.font = [UIFont systemFontOfSize:15];
            _likeLabel.textColor = [UIColor lightGrayColor];
            _likeLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _likeLabel;
        })];
        
        [self addSubview:({
            _shareImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            _shareImageView.layer.masksToBounds = YES;
            _shareImageView.layer.cornerRadius = 15;
            _shareImageView.translatesAutoresizingMaskIntoConstraints = NO;
            
            _shareImageView;
        })];
        [self addSubview:({
            _shareLabel = [[UILabel alloc] init];
            _shareLabel.font = [UIFont systemFontOfSize:15];
            _shareLabel.textColor = [UIColor lightGrayColor];
            _shareLabel.translatesAutoresizingMaskIntoConstraints = NO;
            _shareLabel;
        })];
    }
    return self;
}

// 用类似真实数据获取的方法来设置
- (void)layoutWithModel:(id)model {
    _avatarImageView.image = [UIImage imageNamed:@"Icon-60"];
    _nickLabel.text = @"极客时间";
    
    _commentImageView.image = [UIImage imageNamed:@"comment"];
    _commentLabel.text = @"100";
    
    _likeImageView.image = [UIImage imageNamed:@"praise"];
    _likeLabel.text = @"25";
    
    _shareImageView.image = [UIImage imageNamed:@"share"];
    _shareLabel.text = @"分享";
    
    [NSLayoutConstraint activateConstraints:@[
        // 定义Y轴的约束
        [NSLayoutConstraint constraintWithItem:_avatarImageView
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1
                                      constant:0],
        // 定义X轴的约束
        [NSLayoutConstraint constraintWithItem:_avatarImageView
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:self
                                     attribute:NSLayoutAttributeLeft
                                    multiplier:1
                                      constant:15],
        // 设置宽度，不依赖于别的元素
        [NSLayoutConstraint constraintWithItem:_avatarImageView
                                     attribute:NSLayoutAttributeWidth
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1
                                      constant:30],
        // 设置高度，不依赖于别的元素
        [NSLayoutConstraint constraintWithItem:_avatarImageView
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                    multiplier:1
                                      constant:30],
        // 设置昵称的Y轴
        [NSLayoutConstraint constraintWithItem:_nickLabel
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:_avatarImageView
                                     attribute:NSLayoutAttributeCenterY
                                    multiplier:1
                                      constant:0],
        // 紧贴图片的右边距
        [NSLayoutConstraint constraintWithItem:_nickLabel
                                     attribute:NSLayoutAttributeLeft
                                     relatedBy:NSLayoutRelationEqual
                                        toItem:_avatarImageView
                                     attribute:NSLayoutAttributeRight
                                    multiplier:1
                                      constant:15],
    ]];
    
    //使用VFL，先梳理一下条件; 竖线表示父View
    NSString *vflString = @"H:|-15-[_avatarImageView]-0-[_nickLabel]-(>=0)-[_commentImageView(==_avatarImageView)]-0-[_commentLabel]-15-[_likeImageView(==_avatarImageView)]-0-[_likeLabel]-15-[_shareImageView(==_avatarImageView)]-0-[_shareLabel]-15-|";
    [NSLayoutConstraint activateConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vflString options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(_avatarImageView,_nickLabel,_commentImageView,_commentLabel,_likeImageView,_likeLabel,_shareImageView,_shareLabel)]];
}

@end
