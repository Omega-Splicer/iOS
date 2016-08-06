//
//  OSDeviceViewController.h
//  Omega-Splicer
//
//  Created by Charles Fournier on 13/07/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSBluetoothManager.h"

@interface OSDeviceViewController : UIViewController <OSBluetoothManagerDelegate, CBPeripheralDelegate>

@property (strong, nonatomic) NSString *deviceName;

@property (strong, nonatomic) NSString *firstUUID;

@property (strong, nonatomic) NSString *secondUUID;

@property (strong, nonatomic) NSString *firstValue;

@property (strong, nonatomic) NSString *secondValue;

@property (strong, nonatomic) CBPeripheral *peripheral;

@property (strong, nonatomic) OSBluetoothManager *bluetoothManager;

@end
