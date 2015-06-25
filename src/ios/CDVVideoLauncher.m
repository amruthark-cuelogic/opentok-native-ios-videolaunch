#import "CDVVideoLauncher.h"
#import <Cordova/CDVViewController.h>
#import "CDVVideoLauncherViewController.h"

@implementation CDVVideoLauncher
{
    NSString *listenerCallbackId;
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
    listenerCallbackId = command.callbackId;
    
    viewController = [[CDVVideoLauncherViewController alloc]initWithNibName:@"CDVVideoLauncherViewController" bundle:nil];
    [viewController initSessionWithApiKey:apiKey withSessionId:sessionId withTokenId:tokenId];
    viewController.videoLauncher = self;
    UIViewController *rootVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [rootVC presentViewController:viewController animated:YES completion:nil];
}

- (void)endBrowserVideoCall:(CDVInvokedUrlCommand*)command
{
    NSLog(@"endBrowserVideoCall");
    [viewController endVideoCall];
    NSDictionary *eventData = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"EndVideoCall", @"eventType",
                               nil];
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:eventData];
    [pluginResult setKeepCallbackAsBool:true];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:listenerCallbackId];
}

- (void)reportEvent:(NSDictionary*)eventData
{
    NSLog(@"reportEvent");
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:eventData];
    [pluginResult setKeepCallbackAsBool:true];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:listenerCallbackId];
}

@end