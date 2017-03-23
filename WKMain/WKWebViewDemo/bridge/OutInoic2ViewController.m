//
//  OutInoic2ViewController.m
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/22.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import "OutInoic2ViewController.h"

@interface OutInoic2ViewController ()

@end

@implementation OutInoic2ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.startPage = @"http://192.168.1.165:8080/ios/";
        self.startPage = @"http://192.168.1.226/angular/";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

@end
