//
//  BluetoothManager.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 02/10/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@protocol BluetoothManagerDelegate;

@interface BluetoothManager : NSObject <CBCentralManagerDelegate>

@property (weak) IBOutlet id<BluetoothManagerDelegate> delegate;

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

@protocol BluetoothManagerDelegate <NSObject>

/**
 *  Notify when the manager find a new peripheral
 *
 *  @param bluetoothManager The bluetooth manager
 *  @param peripheralName   THe new peripheral name
 */
- (void)bluetoothManager:(BluetoothManager *)bluetoothManager didDiscoverPeripheral:(NSString *)peripheralName;

/**
 *  Notify when the bluetooth manager is ready to scan
 */
- (void)bluetoothManagerIsReadyToScan:(BluetoothManager *)bluetoothManager;

@end