//
//  WebLoadH5VC.m
//  QianShanJY
//
//  Created by iosdev on 16/5/12.
//  Copyright © 2016年 chinasun. All rights reserved.
//

#import "WebLoadH5VC.h"
#import "QSNetworkConfig.h"
//#import "YYAnimationIndicator.h"

@interface WebLoadH5VC () {
//    YYAnimationIndicator *indicator;
}

@end

@implementation WebLoadH5VC

- (void)viewDidLoad {
    [super viewDidLoad];
    h5View = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight-64)];
    h5View.backgroundColor = [UIColor colorBGGragLighter];
    h5View.delegate = self;
    [self.view addSubview:h5View];
    
    //本地
    //    NSURL *baseURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    //    NSString *path = [[NSBundle mainBundle] pathForResource:@"RiskEmergency_agreement" ofType:@"html"];
    //    NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //    [contentView loadHTMLString:html baseURL:baseURL];
    
    if (_loadUrl) {
        NSString *str = [NSString stringWithFormat:@"%@%@",[QSNetworkConfig sharedInstance].basePingURL,_loadUrl];
        //redo
        str = [NSString stringWithFormat:@"http://192.168.1.114%@",_loadUrl];
        NSURL *url = [NSURL URLWithString:str];
        NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:8];
        [h5View loadRequest:urlRequest];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(nonnull NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
//    CGRect rect = [UIScreen mainScreen].bounds;
//    indicator = [[YYAnimationIndicator alloc]initWithFrame:rect imageSize:CGSizeMake(180, 180)];
//    indicator.loadtext = @"正在加载...";
//    [indicator showAndstartAnimation:self];
//    webView.hidden = YES;
    //[self performSelector:@selector(stopIndicator) withObject:self afterDelay:2.5];
}
- (NSString *)functionTest
{
    NSString *cmd = @" var metaTags=document.getElementsByTagName(\"meta\") ;\
    for (var i = 0; i < metaTags.length; i++) {\
    if (metaTags[i].getAttribute(\"property\") == \"og:url\") {  \
        fbAppIdContent = metaTags[i].getAttribute(\"content\"); \
        break;\
    }}";
    return cmd;

}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad");
    
//    NSString *viewport = [webView stringByEvaluatingJavaScriptFromString:@"(document.getElementById(\"viewport\").content)"];
    
//    NSString *url = [webView stringByEvaluatingJavaScriptFromString:[self functionTest]];
//    
//    int a = 1;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"didFailLoadWithError");
}

- (void)stopIndicator {
//    if (!indicator.hidden) {
//        [indicator stopAnimationWithLoadText:nil withType:YES];
//    }
}

- (void)dealloc {
    int a;
    a = 1;
}

@end
