//
//  ViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSHomeViewController.h"
#import "OSFlyLandscapeViewController.h"

@import SafariServices;

@interface OSHomeViewController () <UINavigationControllerDelegate, SFSafariViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *flyButton;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;
@property (weak, nonatomic) IBOutlet UIButton *newsButton;
@property (weak, nonatomic) IBOutlet UIButton *tutorialButton;

@end

@implementation OSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.navigationController setDelegate:self];
    [self customizeNavigationBar];
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    [super viewWillAppear:animated];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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

- (IBAction)newsButtonClicked:(id)sender {
    SFSafariViewController *svc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:@"http://eip.epitech.eu/2017/omegasplicer"]];
    svc.delegate = self;
    [self.navigationController pushViewController:svc animated:true];
}

#pragma mark - Navigation Controller delegate

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - SFSafariViewController delegate

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
