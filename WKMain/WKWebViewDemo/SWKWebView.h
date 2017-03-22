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

- (void)estimatedProgress:(CGFloat)value;
- (void)titleChange:(NSString*)title;
- (void)haveMutablePage:(BOOL)isCanBack;

@end
@interface SWKWebView : WKWebView<WKUIDelegate>

@property(nonatomic ,strong)NSString* url_string;

@property(nonatomic ,assign)id<SWKWebViewDelegate> delegate;

- (void)removeCache;
- (BOOL)goBack_check;

@end
