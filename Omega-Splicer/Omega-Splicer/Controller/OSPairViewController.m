//
//  PairViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSPairViewController.h"
#import "BluetoothManager.h"

@interface OSPairViewController () <UITableViewDelegate, UITableViewDataSource, BluetoothManagerDelegate>

@property (strong, nonatomic) BluetoothManager *bluetoothManager;

@property (weak, nonatomic) IBOutlet UITableView *deviceTableView;

@property (strong, nonatomic) NSMutableArray *deviceArray;

@end

@implementation OSPairViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = FALSE;
    [self.deviceTableView reloadData];
    [self.bluetoothManager setupBluetoothManager];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.bluetoothManager = [[BluetoothManager alloc] init];
    self.bluetoothManager.delegate = self;
    self.deviceArray = [[NSMutableArray alloc] init];
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

- (void)bluetoothManagerIsReadyToScan:(BluetoothManager *)bluetoothManager {
    [self.bluetoothManager scanForDevice];
}

- (void)bluetoothManager:(BluetoothManager *)bluetoothManager didDiscoverPeripheral:(NSString *)peripheralName {
    
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
