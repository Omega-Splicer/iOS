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

@property (nonatomic) NSInteger debugMessages;

@property (weak, nonatomic) IBOutlet UISegmentedControl *controlsSegmentedControl;

@property (weak, nonatomic) IBOutlet UISegmentedControl *speedUnitSegmentedControl;

@property (weak, nonatomic) IBOutlet UISegmentedControl *debugMessagesSegmentedControl;

@property (weak, nonatomic) IBOutlet UISegmentedControl *flyModeSegmentedControl;

@end

@implementation OSSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.flyMode = 0;
    self.controlsType = 0;
    self.speedUnit = 0;
    self.debugMessages = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.flyMode = [userDefaults integerForKey:@"flyModeKey"];
    self.controlsType = [userDefaults integerForKey:@"controlsKey"];
    self.speedUnit = [userDefaults integerForKey:@"speedUnitKey"];
    self.debugMessages = [userDefaults integerForKey:@"debugMessagesKey"];
    self.flyModeSegmentedControl.selectedSegmentIndex = self.flyMode;
    self.controlsSegmentedControl.selectedSegmentIndex = self.controlsType;
    self.speedUnitSegmentedControl.selectedSegmentIndex = self.speedUnit;
    self.debugMessagesSegmentedControl.selectedSegmentIndex = self.debugMessages;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:self.flyMode forKey:@"flyModeKey"];
    [userDefaults setInteger:self.controlsType forKey:@"controlsKey"];
    [userDefaults setInteger:self.speedUnit forKey:@"speedUnitKey"];
    [userDefaults setInteger:self.debugMessages forKey:@"debugMessagesKey"];
    [userDefaults synchronize];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Actions

- (IBAction)dismissSettingsViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)flyModeChanged:(id)sender {
    self.flyMode = self.flyModeSegmentedControl.selectedSegmentIndex;
}

- (IBAction)controlsChanged:(id)sender {
    self.controlsType = self.controlsSegmentedControl.selectedSegmentIndex;
}

- (IBAction)speedUnitChanged:(id)sender {
    self.speedUnit = self.speedUnitSegmentedControl.selectedSegmentIndex;
}

- (IBAction)debugMessagesChanged:(id)sender {
    self.debugMessages = self.debugMessagesSegmentedControl.selectedSegmentIndex;
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
