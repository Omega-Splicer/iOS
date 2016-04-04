//
//  PairViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSPairViewController.h"
#import "BluetoothManager.h"

@interface OSPairViewController ()

@property (nonatomic) BOOL bluetoothSetup;

@property (nonatomic) BOOL bluetoothScan;

@property (strong, nonatomic) BluetoothManager *bluetoothManager;

@end

@implementation OSPairViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = FALSE;
    self.bluetoothSetup = false;
    self.bluetoothScan = false;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)dismissPairViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.bluetoothSetup && self.bluetoothScan){
        [self.bluetoothManager stopScan];
        self.bluetoothScan = false;
    }
    
    if (self.bluetoothSetup && !self.bluetoothScan) {
        self.bluetoothScan = true;
        [self.bluetoothManager scanForDevice];
    }

    if (!self.bluetoothSetup) {
        self.bluetoothManager = [[BluetoothManager alloc] init];
        [self.bluetoothManager setupBluetoothManager];
        self.bluetoothSetup = true;
    }
}

@end
