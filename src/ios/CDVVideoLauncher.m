#import "CDVVideoLauncher.h"
#import <Cordova/CDVViewController.h>
#import "CDVVideoLauncherViewController.h"

@implementation CDVVideoLauncher
{
    NSString *listenerCallbackIdVideoEndCall;
    NSString *listenerCallbackIdBrowserEndCall;
    CDVVideoLauncherViewController *viewController;
    
}

- (void)videoLaunch:(CDVInvokedUrlCommand*)command
{
    NSLog(@"videoLaunch");
    NSAssert([command argumentAtIndex:0] != nil, @"Arguments dictionary cannot be nil");
    NSDictionary *argDict = [command argumentAtIndex:0];
    NSString *apiKey = [argDict objectForKey:@"apikey"];
    NSString *tokenId = [argDict objectForKey:@"token"];
    NSString *sessionId = [argDict objectForKey:@"sessionID"];
    listenerCallbackIdVideoEndCall = command.callbackId;
    
    viewController = [[CDVVideoLauncherViewController alloc]initWithNibName:@"CDVVideoLauncherViewController" bundle:nil];
    [viewController initSessionWithApiKey:apiKey withSessionId:sessionId withTokenId:tokenId];
    viewController.videoLauncher = self;
    UIViewController *rootVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootVC presentViewController:viewController animated:YES completion:nil];
}

- (void)refreshBrowserVideoCall:(CDVInvokedUrlCommand*)command
{
    NSLog(@"refreshBrowserVideoCall");
    [viewController refreshVideoCall];
    NSDictionary *eventData = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"RefreshVideoCall", @"eventType",
                               nil];
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:eventData];
    [pluginResult setKeepCallbackAsBool:true];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)endBrowserVideoCall:(CDVInvokedUrlCommand*)command
{
    NSLog(@"endBrowserVideoCall");
    listenerCallbackIdBrowserEndCall = command.callbackId;
    [viewController endBrowserVideoCall];
}

- (void)reportEventForBrowserEndCall:(NSDictionary*)eventData
{
    NSLog(@"reportEventForBrowserEndCall");
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:eventData];
    [pluginResult setKeepCallbackAsBool:true];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:listenerCallbackIdBrowserEndCall];
    viewController = nil;
}

- (void)reportEventForVideoEndCall:(NSDictionary*)eventData
{
    NSLog(@"reportEventForVideoEndCall");
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:eventData];
    [pluginResult setKeepCallbackAsBool:true];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:listenerCallbackIdVideoEndCall];
    viewController = nil;
}

@end