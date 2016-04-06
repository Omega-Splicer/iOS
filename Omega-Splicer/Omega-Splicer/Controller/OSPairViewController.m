//
//  PairViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSPairViewController.h"
#import "OSBluetoothManager.h"
#import "MONActivityIndicatorView.h"

@interface OSPairViewController () <UITableViewDelegate, UITableViewDataSource, OSBluetoothManagerDelegate>

@property (strong, nonatomic) OSBluetoothManager *bluetoothManager;

@property (weak, nonatomic) IBOutlet UITableView *deviceTableView;

@property (strong, nonatomic) NSMutableArray *deviceArray;

@property (weak, nonatomic) IBOutlet MONActivityIndicatorView *activityIndicatorView;

@end

@implementation OSPairViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = FALSE;
    [self.deviceTableView reloadData];
    [self.activityIndicatorView startAnimating];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bluetoothManager = [[OSBluetoothManager alloc] init];
    self.bluetoothManager.delegate = self;
    self.deviceArray = [[NSMutableArray alloc] init];
    [self.bluetoothManager setupBluetoothManager];
    
    self.activityIndicatorView.numberOfCircles = 4;
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.bluetoothManager stopScan];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)dismissPairViewController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - Bluetooth manager delegate

- (void)bluetoothManagerIsReadyToScan:(OSBluetoothManager *)bluetoothManager {
    [self.bluetoothManager scanForDevice];
}

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didDiscoverPeripheral:(NSString *)peripheralName {
    [self.activityIndicatorView stopAnimating];
    [self.deviceArray addObject:peripheralName];
    [self.deviceTableView reloadData];
}

#pragma mark - Table View Delegate / Data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.deviceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bluetoothCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"bluetoothCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [self.deviceArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Manage memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
