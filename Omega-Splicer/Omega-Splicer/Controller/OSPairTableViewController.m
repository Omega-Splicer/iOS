//
//  OSPairTableViewController.m
//  Omega-Splicer
//
//  Created by Charles Fournier on 02/05/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import "OSPairTableViewController.h"
#import "MONActivityIndicatorView.h"
#import "OSAlertViewController.h"
#import "OSDeviceViewController.h"

@interface OSPairTableViewController () <OSAlertViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *peripheralArray;

@property (strong, nonatomic) OSBluetoothManager *bluetoothManager;

@end

@implementation OSPairTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];

    self.bluetoothManager = [[OSBluetoothManager alloc] init];
    self.bluetoothManager.delegate = self;
    self.peripheralArray = [[NSMutableArray alloc] init];
    [self.bluetoothManager setupBluetoothManager];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:false animated:animated];
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.bluetoothManager stopScan];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customizeNavigationBar {
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.05 green:0.12 blue:0.21 alpha:1]];
    [self.navigationController.navigationBar setTranslucent:FALSE];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
}

- (void)refresh:(id)sender {
}

#pragma mark - Bluetooth manager delegate

- (void)bluetoothManagerIsReadyToScan:(OSBluetoothManager *)bluetoothManager {
    [self.bluetoothManager scanForDevice];
}

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didDiscoverPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"DidDiscoverPeripheral : %@", peripheral.name);
    
    bool didExist = false;
    
    for (CBPeripheral *iPeripheral in self.peripheralArray) {
        if ([iPeripheral.name isEqualToString:peripheral.name])
            didExist = true;
    }
    if (!didExist) {
        [self.peripheralArray addObject:peripheral];
        [self.tableView reloadData];
    }
}

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didFailToSetupWithError:(OSError *)error {
    OSAlertViewController *alertViewController = [OSAlertViewController alertControllerWithError:error];
    alertViewController.delegate = self;
    [self presentViewController:alertViewController animated:YES completion:nil];
}

#pragma mark - OSAlertViewController delegate

- (void)alertViewControllerDidRequiresToPopViewController:(OSAlertViewController *)alertViewController {
    [self.navigationController popToRootViewControllerAnimated:true];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.peripheralArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bluetoothCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"bluetoothCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    CBPeripheral *tmpPeripheral = [self.peripheralArray objectAtIndex:indexPath.row];
    cell.textLabel.text = tmpPeripheral.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    OSDeviceViewController *deviceVC = [storyboard instantiateViewControllerWithIdentifier:@"deviceVC"];
    deviceVC.bluetoothManager = self.bluetoothManager;
    deviceVC.bluetoothManager.delegate = deviceVC;
    deviceVC.peripheral = [self.peripheralArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:deviceVC animated:true];
}

@end
