//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/21.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import "ViewController.h"
#import "SWKWebViewController.h"


#import "CordovaController.h"
@interface ViewController ()
- (IBAction)toWKWebView:(UIButton *)sender;
- (IBAction)toCordovaView:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)toWKWebView:(UIButton *)sender {
    SWKWebViewController *controller = [[SWKWebViewController alloc]init];
    controller.url_string = @"http://www.qq.com";
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)toCordovaView:(UIButton *)sender {
    CordovaController *controller = [[CordovaController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}
@end
