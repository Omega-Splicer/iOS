//
//  FlyViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Masonry/Masonry.h>
#import <CoreMotion/CoreMotion.h>
#import "FlyViewController.h"

@interface FlyViewController ()

@property (nonatomic, strong) UISlider *powerSlider;

@property (nonatomic) BOOL joystickControls;

@property (nonatomic) double currentMaxAccelX;

@property (nonatomic) double currentMaxAccelY;

@property (nonatomic) double currentMaxAccelZ;

@property (nonatomic) double currentMaxRotX;

@property (nonatomic) double currentMaxRotY;

@property (nonatomic) double currentMaxRotZ;

@property (strong, nonatomic) CMMotionManager *motionManager;

@end

@implementation FlyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults integerForKey:@"controlsKey"] == 0)
        self.joystickControls = YES;
    else
        self.joystickControls = NO;

    [self defaultInterface];
    
    [[UIAccelerometer sharedAccelerometer]setDelegate:self];
    
}

- (void)setupMotionManager {

    self.currentMaxAccelX = 0;
    self.currentMaxAccelY = 0;
    self.currentMaxAccelZ = 0;
    
    self.currentMaxRotX = 0;
    self.currentMaxRotY = 0;
    self.currentMaxRotZ = 0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;

    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        [self outputAccelerationData:accelerometerData.acceleration];
       if (error) {
            NSLog(@"%@", error);
        }
    }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
        [self outputRotationData:gyroData.rotationRate];
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (void)outputAccelerationData:(CMAcceleration)acceleration {
    
}

- (void)outputRotationData:(CMRotationRate)rotation {
    
}

- (void)defaultInterface {
    [self.view addSubview:self.powerSlider];
    [self.powerSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view);
        
//        make.left.mas_equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 50, 0, 0));
        make.width.mas_equalTo(@300);
    }];
    NSLog(@"Interface successfully build");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

#pragma mark - Slider

- (UISlider *)powerSlider {
    if (!_powerSlider) {
        _powerSlider = [[UISlider alloc] init];
        _powerSlider.minimumValue = 0;
        _powerSlider.maximumValue = 100;
        _powerSlider.value = 30;
        
        CGAffineTransform trans = CGAffineTransformMakeRotation(-M_PI_2);
        _powerSlider.transform = trans;
    }
    return _powerSlider;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
