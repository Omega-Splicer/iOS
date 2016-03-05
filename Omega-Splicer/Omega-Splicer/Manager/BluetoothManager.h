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

@property (strong, nonatomic) CBCentralManager *centralManager;

- (void)setupBluetoothManager;

- (void)scanForDevice;

- (void)stopScan;


@end
