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

#pragma mark - CBCentralManagerDelagate

//- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
//    
//}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    NSString *localName = [advertisementData objectForKey:CBAdvertisementDataLocalNameKey];
    if ([localName length] > 0) {
        
        if (self.delegate)
            [self.delegate bluetoothManager:self didDiscoverPeripheral:localName];
        NSLog(@"Found : %@", localName);
    }
}



- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSLog(@"toto did update state");
    if ([central state] == CBCentralManagerStatePoweredOff) {
        NSLog(@"CoreBluetooth BLE hardware is powered off");
    }
    else if ([central state] == CBCentralManagerStatePoweredOn) {
        NSLog(@"CoreBluetooth BLE hardware is powered on and ready");
        if (self.delegate)
            [self.delegate bluetoothManagerIsReadyToScan:self];
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
