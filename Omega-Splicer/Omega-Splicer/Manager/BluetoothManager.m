//
//  BluetoothManager.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 02/10/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "BluetoothManager.h"

#define DEVICE_INFO_SERVICE_UUID @"180A"
#define DEVICE_BATTERY_CHARACTERISTICS_UUID @"2A19"

@implementation BluetoothManager

- (void)setupBluetoothManager {
    
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    
}

- (void)scanForDevice {
    NSArray *services = @[[CBUUID UUIDWithString:DEVICE_INFO_SERVICE_UUID]];
    [self.centralManager scanForPeripheralsWithServices:services options:nil];
}

- (void)stopScan {
    [self.centralManager stopScan];
}

#pragma mark - CBCentralManagerDelagate

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    NSString *localName = [advertisementData objectForKey:CBAdvertisementDataLocalNameKey];
    if ([localName length] > 0) {
        NSLog(@"Found : %@", localName);
    }
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    if ([central state] == CBCentralManagerStatePoweredOff) {
        NSLog(@"CoreBluetooth BLE hardware is powered off");
    }
    else if ([central state] == CBCentralManagerStatePoweredOn) {
        NSLog(@"CoreBluetooth BLE hardware is powered on and ready");
    }
    else if ([central state] == CBCentralManagerStateUnauthorized) {
        NSLog(@"CoreBluetooth BLE state is unauthorized");
    }
    else if ([central state] == CBCentralManagerStateUnknown) {
        NSLog(@"CoreBluetooth BLE state is unknown");
    }
    else if ([central state] == CBCentralManagerStateUnsupported) {
        NSLog(@"CoreBluetooth BLE hardware is unsupported on this platform");
    }
}

#pragma mark - CBPeripheralDelegate

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {
    
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
}

@end
