#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface CDVVideoLauncher : CDVPlugin

- (void)videoLaunch:(CDVInvokedUrlCommand*)command;
- (void)endBrowserVideoCall:(CDVInvokedUrlCommand*)command;
- (void)refreshBrowserVideoCall:(CDVInvokedUrlCommand*)command;
- (void)reportEventForBrowserEndCall:(NSDictionary*)eventData;
- (void)reportEventForVideoEndCall:(NSDictionary*)eventData;
@end