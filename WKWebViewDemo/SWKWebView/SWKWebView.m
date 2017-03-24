//
//  SWKWebView.m
//  WKWebViewDemo
//
//  Created by Samuel on 2017/3/21.
//  Copyright © 2017年 Samuel. All rights reserved.
//

#import "SWKWebView.h"


@implementation SWKWebView


- (instancetype)init
{
    return [self initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setUrl_string:(NSString *)url_string{
    
    if (_url_string==nil) {
        [self addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        [self addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
        [self addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:NULL];
        self.UIDelegate=self;
 
        self.allowsBackForwardNavigationGestures=YES;
        self.opaque = NO;
    }
    _url_string = url_string;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_url_string]];
    [self loadRequest:request];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        //不要让进度条倒着走...有时候goback会出现这种情况
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        if ([self.delegate respondsToSelector:@selector(estimatedProgress:)]) {
            CGFloat i = [change[@"new"] floatValue];
            [self.delegate estimatedProgress:i];
        }
    }else if([keyPath isEqualToString:@"canGoBack"]){
        if ([self.delegate respondsToSelector:@selector(haveMutablePage:)]) {
            [self.delegate haveMutablePage:[change[@"new"]boolValue]];
        }
    }
    else if([keyPath isEqualToString:@"title"]){
        if ([self.delegate respondsToSelector:@selector(titleChange:)]) {
            [self.delegate titleChange:self.title];
        }
    }
    else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}
-(void)dealloc
{
    [self stopLoading];
    [self removeObserver:self forKeyPath:@"estimatedProgress"];
    [self removeObserver:self forKeyPath:@"canGoBack"];
    [self removeObserver:self forKeyPath:@"title"];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    self.UIDelegate = nil;
}

-(void)removeCache
{
    //iOS9 WKWebView新方法：
    NSSet *websiteDataTypes = [NSSet setWithArray:@[WKWebsiteDataTypeDiskCache,WKWebsiteDataTypeOfflineWebApplicationCache,WKWebsiteDataTypeMemoryCache,WKWebsiteDataTypeLocalStorage,WKWebsiteDataTypeCookies,WKWebsiteDataTypeSessionStorage,WKWebsiteDataTypeIndexedDBDatabases,WKWebsiteDataTypeWebSQLDatabases]];
    //你可以选择性的删除一些你需要删除的文件 or 也可以直接全部删除所有缓存的type
    //NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes
                                               modifiedSince:dateFrom completionHandler:^{
                                                   // code
                                               }];
    //    针对与iOS7.0、iOS8.0、iOS9.0 WebView的缓存，我们找到了一个通吃的办法:
    NSString *libraryDir = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,
                                                               NSUserDomainMask, YES)[0];
    NSString *bundleId  =  [[[NSBundle mainBundle] infoDictionary]
                            objectForKey:@"CFBundleIdentifier"];
    NSString *webkitFolderInLib = [NSString stringWithFormat:@"%@/WebKit",libraryDir];
    NSString *webKitFolderInCaches = [NSString
                                      stringWithFormat:@"%@/Caches/%@/WebKit",libraryDir,bundleId];
    NSString *webKitFolderInCachesfs = [NSString
                                        stringWithFormat:@"%@/Caches/%@/fsCachedData",libraryDir,bundleId];
    NSError *error;
    /* iOS8.0 WebView Cache的存放路径 */
    [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCaches error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:webkitFolderInLib error:nil];
    /* iOS7.0 WebView Cache的存放路径 */
    [[NSFileManager defaultManager] removeItemAtPath:webKitFolderInCachesfs error:&error];
    //    H5更新发版的的时候，做一次清除WebView缓存， app的WebView就会显示最新的H5页面了。
}

- (BOOL)goBack_check;
{
    if (self.canGoBack==YES) {
        [self goBack];
        return YES;
    }
    return NO;
}
@end






















