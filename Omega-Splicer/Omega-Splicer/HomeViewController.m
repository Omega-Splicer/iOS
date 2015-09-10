//
//  ViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    
    NSLog(@"Controls settings : %ld", (long)[userDefaults integerForKey:@"controlsKey"]);
    NSLog(@"Speed unit settings : %ld", (long)[userDefaults integerForKey:@"speedUnitKey"]);
    NSLog(@"Debug messages : %ld", (long)[userDefaults integerForKey:@"debugMessagesKey"]);
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape | UIInterfaceOrientationMaskPortrait;
}

@end
