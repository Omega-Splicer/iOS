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

@property (strong, nonatomic) CBPeripheral *connectedPeripheral;

@property (strong, nonatomic) CBService *connectedPeripheralService;

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

- (void)connectPeripheral:(CBPeripheral *)peripheral {
    [self.centralManager connectPeripheral:peripheral options:nil];
}

- (void)disconnectPeripheral:(CBPeripheral *)peripheral {
    [self.centralManager cancelPeripheralConnection:peripheral];
}

- (CBCharacteristic *)getCharacteristicForUUID:(CBUUID *)UUID {

//    NSLog(@"get charac for uuid : %@", UUID);
    
    if (self.connectedPeripheralService) {
//        NSLog(@"LOOP");
        for (CBCharacteristic *charac in self.connectedPeripheralService.characteristics) {
//            NSLog(@"CHARAC UUID : %@ ", charac.UUID);
            if ([charac.UUID isEqual:UUID])
                return charac;
        }
    }
    return nil;
}

- (void)writeValue:(NSData *)value forCharacteristic:(CBCharacteristic *)characteristic {
    NSLog(@"WrtieValue");
    [self.connectedPeripheral writeValue:value forCharacteristic:characteristic type:CBCharacteristicWriteWithoutResponse];
}

#pragma mark - CBCentralManagerDelagate

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    NSLog(@"Connected to %@ ", peripheral.name);
    NSLog(@"%@", peripheral);
    [self.delegate bluetoothManager:self didConnectToPeripheral:peripheral];
    [peripheral setDelegate:self];
    [peripheral discoverServices:@[[CBUUID UUIDWithString:@"58409710-D5E2-4A7D-B439-10CF9C59E89F"]]];
    self.connectedPeripheral = peripheral;
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"Fail to conect to %@", peripheral.name);
    NSLog(@"Error : %@", error);
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI {
    if (self.delegate)
        [self.delegate bluetoothManager:self didDiscoverPeripheral:peripheral];
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
    if (error) {
        NSLog(@"Error discovering services: %@", [error localizedDescription]);
        return;
    }

    for (CBService *service in peripheral.services) {
        NSLog(@"Discovered service %@", service);
        self.connectedPeripheralService = service;
        [peripheral discoverCharacteristics:nil forService:service];
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
//    NSLog(@"Discover peripheral characteritics for service");
    
    
    if (error) {
        NSLog(@"Error discovering characteristics: %@", [error localizedDescription]);
        return;
    }
    NSLog(@"toto");
    
    // Again, we loop through the array, just in case.
    for (CBCharacteristic *characteristic in service.characteristics) {
        NSLog(@"Discovered characteristic : %@", characteristic);
        
        
        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:@"67636659-E5E5-4A2A-92AE-BABDEC2C0E51"]]) {
            [peripheral readValueForCharacteristic:characteristic];
            [peripheral setNotifyValue:true forCharacteristic:characteristic];
        }
        
        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:@"7F88EC10-D269-446A-B26D-6BA9AB70861F"]]) {
            [peripheral readValueForCharacteristic:characteristic];
            [peripheral setNotifyValue:true forCharacteristic:characteristic];
        }
        
//        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:@"7F88EC10-D269-446A-B26D-6BA9AB70861F"]]) {
//            [peripheral readValueForCharacteristic:characteristic];
            
//            NSUInteger index = 42;
//            NSData *payload = [NSData dataWithBytes:&index length:sizeof(index)];
//            
//            [peripheral readValueForCharacteristic:characteristic];
//            [peripheral writeValue:payload forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];
//        }
//        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:REQUIRED_CHARA_ID]]) {
//            // If it is, subscribe to it
//            [peripheral setNotifyValue:YES forCharacteristic:characteristic];
//        }
    }
    
    [self.delegate bluetootManager:self isReadyWithPeripheral:peripheral];
    
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    NSLog(@"Update value for characteritics");
    
    NSData *dataValue = characteristic.value;
    
    NSUInteger index;
    [dataValue getBytes:&index length:sizeof(index)];
    
    NSLog(@"Value : %lu", (unsigned long)index);

    if ([self.delegate respondsToSelector:@selector(bluetoothManager:didUpdateValueForCharacteristic:)]) {
        [self.delegate bluetoothManager:self didUpdateValueForCharacteristic:characteristic];
    }

}

- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    if (error) {
        NSLog(@"Error writing value for characteriscs: %@", [error localizedDescription]);
    } else {
        [self.delegate bluetoothManager:self didUpdateValueForCharacteristic:characteristic];
        NSLog(@"Writing value for characteristics with success");
    }
}

@end
