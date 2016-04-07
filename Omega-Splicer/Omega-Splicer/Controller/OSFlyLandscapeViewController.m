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

@interface OSFlyLandscapeViewController () <JoystickDelegate, UINavigationControllerDelegate>

@property (nonatomic) BOOL joystickControls;

@property (weak, nonatomic) IBOutlet OSJoystick *rightJoystick;

@property (weak, nonatomic) IBOutlet OSJoystick *leftJoystick;

@property (nonatomic) CGPoint lastMovement;

@end

@implementation OSFlyLandscapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.navigationController setDelegate:self];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - OSJoystick delegate

- (void)joystick:(OSJoystick *)aJoysick didUpdate:(CGPoint)movement {
    if (!CGPointEqualToPoint(self.lastMovement, movement)) {
        self.lastMovement = movement;
        NSLog(@"Joystick movement : %f - %f", movement.x, movement.y);
    }
}

#pragma mark - UInavigation view controller delegate

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
    return UIInterfaceOrientationMaskLandscape;
}

@end
