//
//  OSBeaconViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 02/02/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

//#import <EstimoteSDK/EstimoteSDK.h>
#import "OSBeaconViewController.h"

@implementation OSBeaconViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end


//#import "OSBeaconViewController.h"

//@interface OSBeaconViewController () <ESTBeaconManagerDelegate>
//
//@property (nonatomic) ESTBeaconManager *beaconManager;
//
//@end
//
//@implementation OSBeaconViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.beaconManager = [ESTBeaconManager new];
//    self.beaconManager.delegate = self;
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [self.beaconManager requestAlwaysAuthorization];
//    [self.beaconManager startMonitoringForRegion:[[CLBeaconRegion alloc] initWithProximityUUID:ESTIMOTE_PROXIMITY_UUID identifier:@"EstimoteSampleRegion"]];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}
//
//- (IBAction)dismissBeaconView:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

//@end
