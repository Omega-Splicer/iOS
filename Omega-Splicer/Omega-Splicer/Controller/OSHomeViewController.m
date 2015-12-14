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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"Fly mode settings : %ld", (long)[userDefaults integerForKey:@"flyModeKey"]);
    NSLog(@"Controls settings : %ld", (long)[userDefaults integerForKey:@"controlsKey"]);
    NSLog(@"Speed unit settings : %ld", (long)[userDefaults integerForKey:@"speedUnitKey"]);
    NSLog(@"Debug messages : %ld", (long)[userDefaults integerForKey:@"debugMessagesKey"]);
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (IBAction)FlyButtonClicked:(id)sender {
    NSLog(@"Fly button clicked");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger flyMode = [userDefaults integerForKey:@"flyModeKey"];
    
    if (flyMode == 0) {
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"flyPortrait"];
        [self presentViewController:vc animated:YES completion:nil];
    } else {
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"flyLandscape"];
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    
    
}

@end
