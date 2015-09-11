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

@property (nonatomic) BOOL joystickControls;

@property (strong, nonatomic) CMMotionManager *motionManager;

@property (weak, nonatomic) IBOutlet UILabel *accelerationLabel;

@property (weak, nonatomic) IBOutlet UILabel *rotationLabel;

@end

@implementation FlyViewController

- (void)viewWillAppear:(BOOL)animated {
    if (self.joystickControls)
        [self stopMotionManager];
    else
        [self startMotionManager];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self stopMotionManager];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults integerForKey:@"controlsKey"] == 0)
        self.joystickControls = YES;
    else
        self.joystickControls = NO;
    
    [self setupMotionManager];
    
}

- (void)setupMotionManager {
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
}

- (void)startMotionManager {
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

- (void)stopMotionManager {
    [self.motionManager stopAccelerometerUpdates];
    [self.motionManager stopGyroUpdates];
}

- (void)outputAccelerationData:(CMAcceleration)acceleration {
    self.accelerationLabel.text = [NSString stringWithFormat:@"Acceleration : %.1f/%.1f/%.1f", acceleration.x, acceleration.y, acceleration.z];
}

- (void)outputRotationData:(CMRotationRate)rotation {
    self.rotationLabel.text = [NSString stringWithFormat:@"Rotation : %.1f/%.1f/%.1f", rotation.x, rotation.y, rotation.z];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
