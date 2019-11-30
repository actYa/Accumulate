//
//  XWNewsDetailViewController.m
//  TaiZhouEPApp
//
//  Created by apple on 2019/11/29.
//  Copyright © 2019 snew. All rights reserved.
//

#import "XWNewsDetailViewController.h"
#import <WebKit/WebKit.h>
#import "XWMediator.h"

@interface XWNewsDetailViewController () <WKNavigationDelegate>
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) UIProgressView *progressView;
@property (nonatomic,copy) NSString *articleUrl;
@end

@implementation XWNewsDetailViewController

+ (void)load {
    [XWMediator registerScheme:@"detail://" progressBlock:^(NSDictionary * _Nonnull params) {
         NSString *url = (NSString *)[params objectForKey:@"url"];
        UINavigationController *navigationController = (UINavigationController *)[params objectForKey:@"controller"];
        XWNewsDetailViewController *controller = [[XWNewsDetailViewController alloc] initWithArticleUrl:url];
        [navigationController pushViewController:controller animated:YES];
    }];
    
    [XWMediator registerProtol:@protocol(XWNewsDetailViewControllerProtocol) class:[self class]];
}


- (instancetype)initWithArticleUrl:(NSString *)articleUrl {
    self = [super init];
    if (self) {
        self.articleUrl = articleUrl;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:({
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, NAVBAR_SUM_HEIGHT, self.view.width, 1)];
        self.progressView;
    })];
    
//    CALayer *layer = [CALayer layer];
//     layer.frame = CGRectMake(0, 0, 0, 1);
//     layer.backgroundColor = RGBA(233, 55, 35, 1.0).CGColor;
//     [self.progressView.layer addSublayer:layer];
//     self.progresslayer = layer;
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrl]]];
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    //开始
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    //成功回调
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    //失败回调
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
//        self.progresslayer.opacity = 1;
        //不要让进度条倒着走...有时候goback会出现这种情况
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
//        self.progresslayer.frame = CGRectMake(0, 0, self.view.bounds.size.width * [change[@"new"] floatValue], 3);
        self.progressView.progress = self.webView.estimatedProgress;
        if ([change[@"new"] floatValue] == 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                self.progresslayer.opacity = 0;
                self.progressView.hidden = YES;
                
            });
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                self.progresslayer.frame = CGRectMake(0, 0, 0, 0.5);
            });
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    self.webView.scrollView.delegate = nil;
}


@end
