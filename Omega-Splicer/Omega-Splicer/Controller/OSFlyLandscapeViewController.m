//
//  FlyViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "OSFlyLandscapeViewController.h"
#import "OSJoystick.h"

@interface OSFlyLandscapeViewController () <JoystickDelegate>

@property (nonatomic) BOOL joystickControls;

@property (strong, nonatomic) CMMotionManager *motionManager;

//@property (strong, nonatomic) OSJoystick *joystick;
@property (weak, nonatomic) IBOutlet OSJoystick *rightJoystick;

@property (weak, nonatomic) IBOutlet OSJoystick *leftJoystick;

@property (weak, nonatomic) IBOutlet UILabel *accelerationLabel;

@property (weak, nonatomic) IBOutlet UILabel *rotationLabel;

@property (nonatomic) CGPoint lastMovement;

@end

@implementation OSFlyLandscapeViewController

- (void)viewWillAppear:(BOOL)animated {
    if (self.joystickControls) {
        [self displayJoystick];
        [self stopMotionManager];
    } else {
        [self startMotionManager];
        [self removeJoystick];
    }
}

- (IBAction)dismissFlyViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
    [self setupJoystick];
    
}

- (void)setupMotionManager {
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = .2;
    self.motionManager.gyroUpdateInterval = .2;
}

- (void)startMotionManager {
//    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
//        [self outputAccelerationData:accelerometerData.acceleration];
//        if (error) {
//            NSLog(@"%@", error);
//        }
//    }];
//    
//    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
//        [self outputRotationData:gyroData.rotationRate];
//        if (error) {
//            NSLog(@"%@", error);
//        }
//    }];
}

- (void)stopMotionManager {
    [self.motionManager stopAccelerometerUpdates];
    [self.motionManager stopGyroUpdates];
}

- (void)setupJoystick {
    [self.leftJoystick setThumbImage:[UIImage imageNamed:@"joy_thumb"] andBGImage:[UIImage imageNamed:@"stick_base"]];
    [self.rightJoystick setThumbImage:[UIImage imageNamed:@"joy_thumb"] andBGImage:[UIImage imageNamed:@"stick_base"]];
    self.rightJoystick.backgroundColor = [UIColor clearColor];
    self.leftJoystick.backgroundColor = [UIColor clearColor];
}

- (void)displayJoystick {
    [self.view addSubview:self.leftJoystick];
    [self.view addSubview:self.rightJoystick];
}

- (void)removeJoystick {
    [self.leftJoystick removeFromSuperview];
    [self.rightJoystick removeFromSuperview];
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

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

#pragma mark - OSJoystick delegate

- (void)joystick:(OSJoystick *)aJoysick didUpdate:(CGPoint)movement {
    if (!CGPointEqualToPoint(self.lastMovement, movement)) {
        self.lastMovement = movement;
        NSLog(@"Joystick movement : %f - %f", movement.x, movement.y);
    }
}

@end
