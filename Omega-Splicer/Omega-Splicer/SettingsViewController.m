//
//  SettingsViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (nonatomic) NSInteger controlsType;

@property (nonatomic) NSInteger speedUnit;

@property (nonatomic) NSInteger debugMessages;

@property (weak, nonatomic) IBOutlet UISegmentedControl *controlsSegmentedControl;

@property (weak, nonatomic) IBOutlet UISegmentedControl *speedUnitSegmentedControl;

@property (weak, nonatomic) IBOutlet UISegmentedControl *debugMessagesSegmentedControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.controlsType = 0;
    self.speedUnit = 0;
    self.debugMessages = 0;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.controlsType = [userDefaults integerForKey:@"controlsKey"];
    self.speedUnit = [userDefaults integerForKey:@"speedUnitKey"];
    self.debugMessages = [userDefaults integerForKey:@"debugMessagesKey"];
    self.controlsSegmentedControl.selectedSegmentIndex = self.controlsType;
    self.speedUnitSegmentedControl.selectedSegmentIndex = self.speedUnit;
    self.debugMessagesSegmentedControl.selectedSegmentIndex = self.debugMessages;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:self.controlsType forKey:@"controlsKey"];
    [userDefaults setInteger:self.speedUnit forKey:@"speedUnitKey"];
    [userDefaults setInteger:self.debugMessages forKey:@"debugMessagesKey"];
    [userDefaults synchronize];
}

#pragma mark - Actions

- (IBAction)controlsChanged:(id)sender {
    self.controlsType = self.controlsSegmentedControl.selectedSegmentIndex;
}

- (IBAction)speedUnitChanged:(id)sender {
    self.speedUnit = self.speedUnitSegmentedControl.selectedSegmentIndex;
}

- (IBAction)debugMessagesChanged:(id)sender {
    self.debugMessages = self.debugMessagesSegmentedControl.selectedSegmentIndex;
}

#pragma mark - Manage memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
