//
//  SettingsViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSSettingsViewController.h"

@interface OSSettingsViewController ()

@property (nonatomic) NSInteger flyMode;

@property (nonatomic) NSInteger controlsType;

@property (nonatomic) NSInteger speedUnit;

@property (weak, nonatomic) IBOutlet UISegmentedControl *controlsSegmentedControl;

@property (weak, nonatomic) IBOutlet UISegmentedControl *speedUnitSegmentedControl;

@property (weak, nonatomic) IBOutlet UISegmentedControl *flyModeSegmentedControl;

@end

@implementation OSSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flyMode = 0;
    self.controlsType = 0;
    self.speedUnit = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.flyMode = [userDefaults integerForKey:@"flyModeKey"];
    self.controlsType = [userDefaults integerForKey:@"controlsKey"];
    self.speedUnit = [userDefaults integerForKey:@"speedUnitKey"];
    self.flyModeSegmentedControl.selectedSegmentIndex = self.flyMode;
    self.controlsSegmentedControl.selectedSegmentIndex = self.controlsType;
    self.speedUnitSegmentedControl.selectedSegmentIndex = self.speedUnit;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:self.flyMode forKey:@"flyModeKey"];
    [userDefaults setInteger:self.controlsType forKey:@"controlsKey"];
    [userDefaults setInteger:self.speedUnit forKey:@"speedUnitKey"];
    [userDefaults synchronize];
}

#pragma mark - Actions

- (IBAction)flyModeChanged:(id)sender {
    self.flyMode = self.flyModeSegmentedControl.selectedSegmentIndex;
}

- (IBAction)controlsChanged:(id)sender {
    self.controlsType = self.controlsSegmentedControl.selectedSegmentIndex;
}

- (IBAction)speedUnitChanged:(id)sender {
    self.speedUnit = self.speedUnitSegmentedControl.selectedSegmentIndex;
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
