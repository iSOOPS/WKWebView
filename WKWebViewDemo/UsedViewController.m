//
//  UsedViewController.m
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/24.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import "UsedViewController.h"

@interface UsedViewController ()

@end

@implementation UsedViewController

- (void)viewDidLoad {
    self.url_string = @"http://www.taobao.com";
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    [super userContentController:userContentController didReceiveScriptMessage:message];
    NSLog(@"massage%@",message);
}

@end
