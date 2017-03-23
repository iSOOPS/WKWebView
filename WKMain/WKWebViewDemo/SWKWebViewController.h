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

@property(nonatomic ,strong)NSString* url_string;

@property(nonatomic ,strong)NSMutableArray<NSString*>* jsInterfaces;

@property(nonatomic ,assign)id<SWKWebViewControllerDelegate> delegate;

@end
