//
//  BluetoothManager.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 02/10/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "OSBluetoothPeripheral.h"
#import "OSError.h"

@protocol OSBluetoothManagerDelegate;

@interface OSBluetoothManager : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate>

/**
 *  The delegate object
 */
@property (weak) IBOutlet id<OSBluetoothManagerDelegate> delegate;

/**
 *  Setup the initial state for the bluetooth manager
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

@protocol OSBluetoothManagerDelegate <NSObject>

/**
 *  Notify when the manager find a new peripheral
 *
 *  @param bluetoothManager The bluetooth manager
 *  @param peripheralName   THe new peripheral name
 */
- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didDiscoverPeripheral:(OSBluetoothPeripheral *)peripheral;

/**
 *  Notify when the bluetooth manager is ready to scan
 */
- (void)bluetoothManagerIsReadyToScan:(OSBluetoothManager *)bluetoothManager;

/**
 * Notify when the bluetooth manager fail to setup
 */
- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didFailToSetupWithError:(OSError *)error;

@end