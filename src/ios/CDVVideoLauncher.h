#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface CDVVideoLauncher : CDVPlugin

- (void)videoLaunch:(CDVInvokedUrlCommand*)command;
- (void)endBrowserVideoCall:(CDVInvokedUrlCommand*)command;
- (void)reportEvent:(NSDictionary*)eventData;

@end