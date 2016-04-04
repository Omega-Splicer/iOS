//
//  BluetoothManager.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 02/10/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface BluetoothManager : NSObject <CBCentralManagerDelegate>

/**
 *  Bluetooth central manager
 */
@property (strong, nonatomic) CBCentralManager *centralManager;

/**
 *  Setup the bluetooth manager
 */
- (void)setupBluetoothManager;

/**
 *  Start bluetooth scan
 */
- (void)scanForDevice;

/**
 *  Stop bluetooth scan
 */
- (void)stopScan;


@end
