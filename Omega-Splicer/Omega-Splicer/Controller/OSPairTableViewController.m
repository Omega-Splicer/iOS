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
#import "OSBluetoothManager.h"

@interface OSPairTableViewController () <OSBluetoothManagerDelegate, OSAlertViewControllerDelegate>

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

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didDiscoverPeripheral:(OSBluetoothPeripheral *)peripheral {
    NSLog(@"DidDiscoverPeripheral : %@", peripheral.name);
    
    bool didExist = false;
    
    for (OSBluetoothPeripheral *iPeripheral in self.peripheralArray) {
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
    
    OSBluetoothPeripheral *tmpPeripheral = [self.peripheralArray objectAtIndex:indexPath.row];
    cell.textLabel.text = tmpPeripheral.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%@", [self.peripheralArray objectAtIndex:indexPath.row]);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
