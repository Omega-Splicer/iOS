//
//  BluetoothManager.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 02/10/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "OSError.h"

#define UUID_TEST_SERVICE @"58409710-D5E2-4A7D-B439-10CF9C59E89F"
#define UUID_READ_CHARACTERISTIC @"67636659-E5E5-4A2A-92AE-BABDEC2C0E51"
#define UUID_WRITE_CHARACTERISTIC @"7F88EC10-D269-446A-B26D-6BA9AB70861F"

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

/**
 * Try to connect to the given peripheral
 */
- (void)connectPeripheral:(CBPeripheral *)peripheral;

/**
 * Cancel the actual or pending connection with the peripheral
 */
- (void)disconnectPeripheral:(CBPeripheral *)peripheral;

/**
 *
 */
- (CBCharacteristic *)getCharacteristicForUUID:(CBUUID *)UUID;

/**
 *
 */
- (void)writeValue:(NSData *)value forCharacteristic:(CBCharacteristic *)characteristic;

@end

@protocol OSBluetoothManagerDelegate <NSObject>

@required

/**
 *  Notify when the manager find a new peripheral
 *
 *  @param bluetoothManager The bluetooth manager
 *  @param peripheralName   THe new peripheral name
 */
- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didDiscoverPeripheral:(CBPeripheral *)peripheral;

/**
 *  Notify when the bluetooth manager is ready to scan
 */
- (void)bluetoothManagerIsReadyToScan:(OSBluetoothManager *)bluetoothManager;

/**
 * Notify when the bluetooth manager fail to setup
 */
- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didFailToSetupWithError:(OSError *)error;

@optional

/**
 * Notify if the peripheral connection fail
 */
- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didFailToConnect:(OSError *)error;

/**
 * Notify is the peripheral is connected
 */
- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didConnectToPeripheral:(CBPeripheral *)peripheral;

/**
 * Notify when characteristic is update
 */
- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic;

/**
 * Notify when the manager find a characteristic
 */
- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didDiscoverCharacteristic:(CBCharacteristic *)characteristic;

- (void)bluetootManager:(OSBluetoothManager *)bluetoothManager isReadyWithPeripheral:(CBPeripheral *)peripheral;
@end