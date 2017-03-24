//
//  SWKWebViewController.m
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/21.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import "SWKWebViewController.h"


#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"

@interface SWKWebViewController ()<SWKWebViewDelegate,WKScriptMessageHandler,WKNavigationDelegate>

@property(nonatomic ,strong)NJKWebViewProgressView *progressView;

@end

@implementation SWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWKWebView];
    [self initNavgationItem];
    [self initLoadingView];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.progressView!=nil) {
        [self.navigationController.navigationBar addSubview:self.progressView];
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.progressView!=nil) {
        [self.progressView removeFromSuperview];
        self.progressView = nil;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - init UI
- (void)initWKWebView
{
    if (self.jsInterfaces!=nil || self.jsInterfaces.count>0) {
        WKWebViewConfiguration *config = [WKWebViewConfiguration new];
        //初始化偏好设置属性：preferences
        config.preferences = [WKPreferences new];
        //The minimum font size in points default is 0;
        config.preferences.minimumFontSize = 10;
        //是否支持JavaScript
        config.preferences.javaScriptEnabled = YES;
        //不通过用户交互，是否可以打开窗口
        config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
        //通过JS与webView内容交互
        config.userContentController = [WKUserContentController new];
        // 注入JS对象名称xxxxx，当JS通过xxxxxx来调用时，我们可以在WKScriptMessageHandler代理中接收到
        for (NSString*interface in self.jsInterfaces) {
            [config.userContentController addScriptMessageHandler:self name:interface];
        }
        self.webView = [[SWKWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) configuration:config];
    }
    else{
        self.webView = [[SWKWebView alloc]init];
    }
    self.webView.url_string = self.url_string;
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    self.webView.delegate = self;
}
- (void)initLoadingView
{
    if (self.closeProgressBar == YES) {
        return;
    }
    CGFloat progressBarHeight = 2.f;
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
    self.progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    self.progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.progressView setProgress:0 animated:YES];
}
- (void)initNavgationItem
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 98, 40)];
    //将leftItem设置为自定义按钮
    UIBarButtonItem  *leftItem =[[UIBarButtonItem alloc]initWithCustomView: view];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    //自定义一个按钮
    UIButton  *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(setDefaultLeftBack:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:leftBtn];

    if (self.closeMutableButton == NO) {
        UIButton  *leftBtnClose = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftBtnClose setTitle:@"关闭" forState:UIControlStateNormal];
        [leftBtnClose addTarget:self action:@selector(setLeftBack:) forControlEvents:UIControlEventTouchUpInside];
        leftBtnClose.frame = CGRectMake(54, 0, 44, 44);
        [leftBtnClose setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [view addSubview:leftBtnClose];
    }
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    // 在发送请求之前，决定是否跳转
    decisionHandler(WKNavigationActionPolicyAllow);
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    // 在收到响应后，决定是否跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
}
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation;{
    // 接收到服务器跳转请求之后调用
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation;{
    // 页面开始加载时调用
}
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation;{
    // 当内容开始返回时调用
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation;{
    // 页面加载完成之后调用
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation;{
    // 页面加载失败时调用
}

#pragma mark - Button Action
- (void)setDefaultLeftBack:(UIButton *)sender
{
    if ([self.webView goBack_check]==NO) {
        [self back];
    }
}
- (void)setLeftBack:(UIButton *)sender
{
    [self back];
}

- (void)back
{
    if (self.parentViewController.childViewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
    }
}
#pragma mark - SWKWebViewDelegate
- (void)estimatedProgress:(CGFloat)value
{
    [self.progressView setProgress:value animated:YES];
}
- (void)titleChange:(NSString *)title
{
    [self setTitle:title];
}
- (void)haveMutablePage:(BOOL)isCanBack
{
    
}
#pragma mark - WKScriptMessageHandler
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    if ([self.delegate respondsToSelector:@selector(htmlRequrieToIOS:andData:andBaseInterfaces:)]) {
        for (NSString *interface in self.jsInterfaces) {
            //这里可以通过name处理多组交互
            if ([message.name isEqualToString:interface]) {
                //body只支持NSNumber, NSString, NSDate, NSArray,NSDictionary 和 NSNull类型
                [self.delegate htmlRequrieToIOS:message.name andData:message.body andBaseInterfaces:self.jsInterfaces];
            }
        }
    }
}
- (void)sendFuntionToJavaScript:(NSString*)script block:(void(^)(id response))result;
{
    [self.webView evaluateJavaScript:script
                   completionHandler:^(id _Nullable response, NSError * _Nullable error) {
                       result(result);
                   }];
}
@end
