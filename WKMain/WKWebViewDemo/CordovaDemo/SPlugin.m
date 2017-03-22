//
//  SPlugin.m
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/22.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import "SPlugin.h"

@implementation SPlugin

- (void)myMethod:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* myarg = [command.arguments objectAtIndex:0];
    if (myarg != nil) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Arg was null"];
    }
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
