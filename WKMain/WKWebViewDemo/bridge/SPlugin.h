//
//  SPlugin.h
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/22.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
@interface SPlugin : CDVPlugin

-(void)toast:(CDVInvokedUrlCommand *)command;

-(void)testCallJs:(CDVInvokedUrlCommand *)command;

@end
