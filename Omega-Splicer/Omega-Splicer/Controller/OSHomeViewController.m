//
//  ViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSHomeViewController.h"
#import "OSFlyLandscapeViewController.h"

@interface OSHomeViewController ()
@end

@implementation OSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Navigation Bar Customization

- (void)customizeNavigationBar {
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.05 green:0.12 blue:0.21 alpha:1]];
    [self.navigationController.navigationBar setTranslucent:FALSE];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

#pragma mark - Actions

- (IBAction)FlyButtonClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger flyMode = [userDefaults integerForKey:@"flyModeKey"];
    
    if (flyMode == 0) {
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"flyPortrait"];
        [self.navigationController pushViewController:vc animated:true];
    } else {
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"flyLandscape"];
        [self.navigationController pushViewController:vc animated:true];
    }
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
