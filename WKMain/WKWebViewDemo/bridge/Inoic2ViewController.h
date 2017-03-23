//
//  Inoic2ViewController.h
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/22.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Cordova/CDVViewController.h>
#import <Cordova/CDVCommandDelegateImpl.h>
#import <Cordova/CDVCommandQueue.h>
@interface Inoic2ViewController : CDVViewController

@end
@interface MainCommandDelegate : CDVCommandDelegateImpl
@end

@interface MainCommandQueue : CDVCommandQueue
@end
