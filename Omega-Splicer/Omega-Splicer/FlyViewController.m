//
//  FlyViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "FlyViewController.h"

@interface FlyViewController ()

@property (nonatomic, strong) UISlider *powerSlider;

@property (nonatomic) BOOL joystickControls;

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
