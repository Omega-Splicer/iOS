//
//  OSFlyPortraitViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 05/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "OSFlyPortraitViewController.h"
#import "OSSliderView.h"

@interface OSFlyPortraitViewController ()

@property (weak, nonatomic) IBOutlet OSSliderView *sliderView;

@property (weak, nonatomic) IBOutlet UIButton *settingsButton;

@property (strong, nonatomic) CMMotionManager *motionManager;

@property (weak, nonatomic) IBOutlet UIImageView *planeImageView;

@end

@implementation OSFlyPortraitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settingsButton.tintColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
    self.settingsButton.hidden = YES;
    [self setupMotionManager];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.sliderView buildSlider];
    [self.sliderView updateConstraintsIfNeeded];
    [self.sliderView setTextColor:[UIColor whiteColor]];
    [self.sliderView setSliderColor:[UIColor colorWithRed:0.05 green:0.12 blue:0.21 alpha:1]];
    [self.sliderView setBackgroundColor:[UIColor colorWithRed:0.08 green:0.2 blue:0.35 alpha:0.7]];
    [self startMotionManager];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self stopMotionManager];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Actions

- (void)setupMotionManager {
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.deviceMotionUpdateInterval = 0.01f;
}

- (void)startMotionManager {
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
    }];
}

- (void)stopMotionManager {
    [self.motionManager stopDeviceMotionUpdates];
}

- (IBAction)closeButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
