//
//  GTSearchBar.m
//  SampleApp
//
//  Created by QTT on 2021/10/19.
//

#import "GTSearchBar.h"
#import "GTScreen.h"

@interface GTSearchBar()<UITextFieldDelegate>
@property(nonatomic,strong,readwrite)UITextField *textField;
@end

@implementation GTSearchBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _textField = [[UITextField alloc] initWithFrame:CGRectMake(UI(10), UI(5), frame.size.width-UI(10)*2, frame.size.height-UI(5)*2)];
            _textField.backgroundColor = [UIColor whiteColor];
            _textField.delegate = self;
            _textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
            _textField.leftViewMode = UITextFieldViewModeAlways;
            _textField.clearButtonMode = UITextFieldViewModeAlways;
            _textField.placeholder = @"今日热点推荐";
            _textField;
        })];
    }
    return self;
}

#pragma mark -
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"");
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"");
}
- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    NSLog(@"");
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // 字数判断
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textField resignFirstResponder];
    // 发起网络请求
    return YES;
}

@end
