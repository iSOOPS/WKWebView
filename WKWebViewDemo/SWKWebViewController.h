//
//  SWKWebViewController.h
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/21.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWKWebView.h"
@protocol SWKWebViewControllerDelegate <NSObject>

- (void)htmlRequrieToIOS:(NSString*)keyString andData:(id)data andBaseInterfaces:(NSMutableArray<NSString*>*)interfaces;

@end

@interface SWKWebViewController : UIViewController

/**
 url加载
 */
@property(nonatomic ,strong)NSString* url_string;

/**
 wkWebView
 */
@property (nonatomic,strong)SWKWebView *webView;

/**
 js回调接口名
 */
@property(nonatomic ,strong)NSMutableArray<NSString*>* jsInterfaces;

/**
 代理模式
 */
@property(nonatomic ,assign)id<SWKWebViewControllerDelegate> delegate;

/**
 用于重写js接口回调内容
 */
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;

/**
 用于重写navtionBar上的UI
 */
- (void)initNavgationItem;

/**
 是否关闭进度条
 */
@property(nonatomic )BOOL closeProgressBar;

/**
 是否关闭2级按钮
 */
@property(nonatomic )BOOL closeMutableButton;


@end
