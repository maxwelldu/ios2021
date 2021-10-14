//
//  GTDetailViewController.m
//  SampleApp
//
//  Created by QTT on 2021/10/13.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController ()<WKNavigationDelegate>

@property(nonatomic, strong, readwrite) WKWebView *webview;
@property(nonatomic, strong, readwrite) UIProgressView *progressView;
@property(nonatomic, copy, readwrite)NSString *articleUrl;

@end

@implementation GTDetailViewController

- (void)dealloc
{
    [self.webview removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (instancetype)initWithUrlString:(NSString *)urlString {
    self = [super init];
    if (self) {
        self.articleUrl = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
        self.webview.navigationDelegate = self;
        self.webview;
    })];
    [self.view addSubview:({
        //有2像素的问题,88+2
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88+2, 375, 20)];
        self.progressView;
    })];
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    
    [self.webview addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.progressView.progress = self.webview.estimatedProgress;
}
-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"");
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
