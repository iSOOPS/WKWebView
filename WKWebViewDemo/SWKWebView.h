//
//  SWKWebView.h
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/21.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@protocol SWKWebViewDelegate <NSObject>

/**
 加载进度
 */
- (void)estimatedProgress:(CGFloat)value;

/**
 标题更改
 */
- (void)titleChange:(NSString*)title;

/**
 是否可以返回上级
 */
- (void)haveMutablePage:(BOOL)isCanBack;

@end
@interface SWKWebView : WKWebView<WKUIDelegate>

@property(nonatomic ,strong)NSString* url_string;

@property(nonatomic ,assign)id<SWKWebViewDelegate> delegate;

/**
 删除缓存
 */
- (void)removeCache;

/**
 返回上级
 */
- (BOOL)goBack_check;

@end
