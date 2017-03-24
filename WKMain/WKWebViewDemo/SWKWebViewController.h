//
//  SWKWebViewController.h
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/21.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SWKWebViewControllerDelegate <NSObject>

- (void)htmlRequrieToIOS:(NSString*)keyString andData:(id)data andBaseInterfaces:(NSMutableArray<NSString*>*)interfaces;

@end

@interface SWKWebViewController : UIViewController

@property(nonatomic ,assign)id<SWKWebViewControllerDelegate> delegate;

/**
 加载路径
 */
@property(nonatomic ,strong)NSString* url_string;

/**
 js回调接口名称
 */
@property(nonatomic ,strong)NSMutableArray<NSString*>* jsInterfaces;

/**
 是否关闭进度条
 */
@property(nonatomic )BOOL closeProgressBar;

/**
 是否关闭2级按钮
 */
@property(nonatomic )BOOL closeMutableButton;

@end
