//
//  OSFlyPortraitViewController.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 05/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSBluetoothManager.h"

@interface OSFlyPortraitViewController : UIViewController <OSBluetoothManagerDelegate, CBPeripheralDelegate>

@property (strong, nonatomic) CBPeripheral *peripheral;

@property (strong, nonatomic) OSBluetoothManager *bluetoothManager;

@end