
#import <UIKit/UIKit.h>
#import <Opentok/Opentok.h>
#import <QuartzCore/QuartzCore.h>
#import "CDVVideoLauncher.h"

@interface CDVVideoLauncherViewController : UIViewController <OTSessionDelegate, OTPublisherDelegate, UITextFieldDelegate, UIGestureRecognizerDelegate, UIScrollViewDelegate> {
    
}
@property (retain, nonatomic) NSString *strApiKey;
@property (retain, nonatomic) NSString *strSessionId;
@property (retain, nonatomic) NSString *strToken;
@property (strong, nonatomic) IBOutlet UIScrollView *videoContainerView;
@property (strong, nonatomic) IBOutlet UIView *bottomOverlayView;
@property (strong, nonatomic) IBOutlet UIView *topOverlayView;
@property (retain, nonatomic) IBOutlet UIButton *cameraToggleButton;
@property (retain, nonatomic) IBOutlet UIButton *audioPubUnpubButton;
@property (retain, nonatomic) IBOutlet UILabel *userNameLabel;
@property (retain, nonatomic) NSTimer *overlayTimer;
@property (retain, nonatomic) IBOutlet UIButton *audioSubUnsubButton;
@property (retain, nonatomic) IBOutlet UIButton *endCallButton;
@property (retain, nonatomic) IBOutlet UIView *micSeparator;
@property (retain, nonatomic) IBOutlet UIView *cameraSeparator;
@property (retain, nonatomic) IBOutlet UIView *archiveOverlay;
@property (retain, nonatomic) IBOutlet UILabel *archiveStatusLbl;
@property (retain, nonatomic) IBOutlet UIImageView *archiveStatusImgView;
@property (retain, nonatomic) IBOutlet UIImageView *rightArrowImgView;
@property (retain, nonatomic) IBOutlet UIImageView *leftArrowImgView;
@property (retain, nonatomic) IBOutlet UIImageView *archiveStatusImgView2;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *busyActivityView;;
@property (retain, nonatomic) CDVVideoLauncher *videoLauncher;

- (IBAction)toggleAudioSubscribe:(id)sender;
- (IBAction)toggleCameraPosition:(id)sender;
- (IBAction)toggleAudioPublish:(id)sender;
- (IBAction)endCallAction:(UIButton *)button;

- (void)initSessionWithApiKey:(NSString *) apiKey withSessionId:(NSString *) sessionId withTokenId:(NSString *) tokenId;
- (void)endVideoCall;

@end