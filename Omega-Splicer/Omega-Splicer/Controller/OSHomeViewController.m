//
//  ViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSHomeViewController.h"
#import "OSFlyLandscapeViewController.h"
#import "StyleKit.h"

@interface OSHomeViewController () <UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *flyButton;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;
@property (weak, nonatomic) IBOutlet UIButton *newsButton;
@property (weak, nonatomic) IBOutlet UIButton *tutorialButton;

@end

@implementation OSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customizeNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.navigationController setDelegate:self];
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    [super viewWillAppear:animated];
}

#pragma mark - Navigation Bar Customization

- (void)customizeNavigationBar {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTranslucent:true];
    
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

#pragma mark - Navigation Controller delegate

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
