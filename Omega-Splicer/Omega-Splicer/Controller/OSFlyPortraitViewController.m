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

@property (strong, nonatomic) CMMotionManager *motionManager;

@property (weak, nonatomic) IBOutlet UIImageView *planeImageView;

@property (nonatomic) CGFloat xGravity;

@end

@implementation OSFlyPortraitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMotionManager];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
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

#pragma mark - Motion manager

- (void)setupMotionManager {
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.deviceMotionUpdateInterval = 0.01f;
}

- (void)startMotionManager {
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        [self updateMotionManagerData:motion];
    }];
}

- (void)updateMotionManagerData:(CMDeviceMotion *)motion {
    self.xGravity = motion.gravity.x;
}

- (void)stopMotionManager {
    [self.motionManager stopDeviceMotionUpdates];
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
