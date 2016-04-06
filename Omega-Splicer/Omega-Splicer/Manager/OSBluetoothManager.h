//
//  BluetoothManager.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 02/10/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@protocol OSBluetoothManagerDelegate;

@interface OSBluetoothManager : NSObject <CBCentralManagerDelegate>

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
- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didDiscoverPeripheral:(NSString *)peripheralName;

/**
 *  Notify when the bluetooth manager is ready to scan
 */
- (void)bluetoothManagerIsReadyToScan:(OSBluetoothManager *)bluetoothManager;

@end