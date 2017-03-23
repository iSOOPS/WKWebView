//
//  ViewController.m
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/21.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import "ViewController.h"
#import "SWKWebViewController.h"
#import "Inoic2ViewController.h"
#import "OutInoic2ViewController.h"
@interface ViewController ()<SWKWebViewControllerDelegate>
- (IBAction)toWKWebView:(UIButton *)sender;
- (IBAction)toinoicView:(UIButton *)sender;
- (IBAction)tooutInoicView:(UIButton *)sender;

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
    NSMutableArray *interfaces = [[NSMutableArray alloc]init];
    [interfaces addObject:@"one"];
    [interfaces addObject:@"two"];
    
    SWKWebViewController *controller = [[SWKWebViewController alloc]init];
    controller.url_string = @"http://www.qq.com";
    controller.delegate = self;
    [self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)toinoicView:(UIButton *)sender {
    Inoic2ViewController *aaa = [[Inoic2ViewController alloc]init];
    [self.navigationController pushViewController:aaa animated:YES];

}

- (IBAction)tooutInoicView:(UIButton *)sender {
    OutInoic2ViewController *aaa = [[OutInoic2ViewController alloc]init];
//    aaa userAgent = @"http://192.168.1.165:8080/cordova/";
//    [aaa setBaseUserAgent:@"http://192.168.1.165:8080/cordova/"];
    [self.navigationController pushViewController:aaa animated:YES];
    
}

- (void)htmlRequrieToIOS:(NSString *)keyString andData:(id)data andBaseInterfaces:(NSMutableArray<NSString *> *)interfaces
{
    if ([keyString isEqualToString:@"one"]) {
        
    }
    else if ([keyString isEqualToString:@"two"]){
        
    }
}
@end
