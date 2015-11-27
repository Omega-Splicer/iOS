//
//  BluetoothManager.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 02/10/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

/*
    Bluetooth Services : https://developer.bluetooth.org/gatt/services/Pages/ServicesHome.aspx
    Bluetooth Characteristics : https://developer.bluetooth.org/gatt/characteristics/Pages/CharacteristicsHome.aspx
 */

@interface BluetoothManager : NSObject

//<CBCentralManagerDelegate, CBPeripheralDelegate>

/**
 *  The central manager used to discover and connect to new bluetooth devices
 */
@property (strong, nonatomic) CBCentralManager *centralManager;

/**
 *  The bluetooth peripheral
 */
@property (strong, nonatomic) CBPeripheral *peripheral;

/**
 *  This method is used to setup correctly the bluetooth manager
 */
- (void)setupBluetoothManager;

/**
 *  This method is used to proceed a scan in order to discover new devices
 */
- (void)scanForDevice;

/**
 *  This method end the current scan
 */
- (void)stopScan;

@end
