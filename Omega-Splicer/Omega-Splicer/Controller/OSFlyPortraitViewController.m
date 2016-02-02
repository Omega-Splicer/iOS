//
//  OSFlyPortraitViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 05/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "OSFlyPortraitViewController.h"
#import "CFSliderView.h"

@interface OSFlyPortraitViewController ()

@property (weak, nonatomic) IBOutlet CFSliderView *sliderView;

@property (weak, nonatomic) IBOutlet UIButton *settingsButton;

@property (strong, nonatomic) CMMotionManager *motionManager;

@end

@implementation OSFlyPortraitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.settingsButton.tintColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
    self.settingsButton.hidden = YES;
    [self setupMotionManager];
}

- (void)viewDidAppear:(BOOL)animated {
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

- (void)setupMotionManager {
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
}

- (void)startMotionManager {
    NSLog(@"Start motion manager");
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            [self outputAccelerationData:accelerometerData.acceleration];
        }
    }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        } else {
            [self outputRotationData:gyroData.rotationRate];
        }
    }];
}

- (void)outputAccelerationData:(CMAcceleration)acceleration {
    NSLog(@"Acceleration : %.1f/%.1f/%.1f", acceleration.x, acceleration.y, acceleration.z);
}

- (void)outputRotationData:(CMRotationRate)rotation {
    NSLog(@"Rotation : %.1f/%.1f/%.1f", rotation.x, rotation.y, rotation.z);
}

- (void)stopMotionManager {
    [self.motionManager stopAccelerometerUpdates];
    [self.motionManager stopGyroUpdates];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)closeButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
