//
//  BluetoothManager.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 02/10/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSBluetoothManager.h"

@interface OSBluetoothManager()

@property (strong, nonatomic) CBCentralManager *centralManager;

@end

@implementation OSBluetoothManager

- (void)setupBluetoothManager {
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:nil];
    NSLog(@"setup ble");
}

- (void)scanForDevice {
    [self.centralManager scanForPeripheralsWithServices:nil options:nil];
    NSLog(@"Begin scan");
}

- (void)stopScan {
    [self.centralManager stopScan];
}

- (void)connectToPeripheral:(OSBluetoothPeripheral *)peripheral {
    [self.centralManager connectPeripheral:[peripheral getPeripheral] options:nil];
}

#pragma mark - CBCentralManagerDelagate

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"Connected to %@ ", peripheral.name);
    peripheral.delegate = self;
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"Fail to conect to %@", peripheral.name);
    NSLog(@"Error : %@", error);
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    OSBluetoothPeripheral *newPeripheral = [[OSBluetoothPeripheral alloc] initWithPeripheral:peripheral];
    if (self.delegate)
        [self.delegate bluetoothManager:self didDiscoverPeripheral:newPeripheral];
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    if ([central state] == CBCentralManagerStatePoweredOff) {
        if (self.delegate) {
            OSError *error = [[OSError alloc] initWithErrorCode:OSErrorBluetoothPoweredOff];
            [self.delegate bluetoothManager:self didFailToSetupWithError:error];
        }
    }
    else if ([central state] == CBCentralManagerStatePoweredOn) {
        if (self.delegate)
            [self.delegate bluetoothManagerIsReadyToScan:self];
    }
    else if ([central state] == CBCentralManagerStateUnauthorized) {
        if (self.delegate) {
            OSError *error = [[OSError alloc] initWithErrorCode:OSErrorBluetoothUnauthorized];
            [self.delegate bluetoothManager:self didFailToSetupWithError:error];
        }
    }
    else if ([central state] == CBCentralManagerStateUnknown) {
        if (self.delegate) {
            OSError *error = [[OSError alloc] initWithErrorCode:OSErrorBluetoothUnknown];
            [self.delegate bluetoothManager:self didFailToSetupWithError:error];
        }
    }
    else if ([central state] == CBCentralManagerStateUnsupported) {
        if (self.delegate) {
            OSError *error = [[OSError alloc] initWithErrorCode:OSErrorBluetoothUnsupported];
            [self.delegate bluetoothManager:self didFailToSetupWithError:error];
        }
    }
}

#pragma mark - CBPeripheralDelegate

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    NSLog(@"Discover peripheral service");
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    NSLog(@"Discover peripheral characteritics for service");
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    NSLog(@"Update value for characteritics");
}

@end
