//
//  OSBluetoothPeripheral.m
//  Omega-Splicer
//
//  Created by Charles Fournier on 02/05/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import "OSBluetoothPeripheral.h"

@interface OSBluetoothPeripheral()

@property (strong, nonatomic) CBPeripheral *peripheral;

@end

@implementation OSBluetoothPeripheral

- (instancetype)initWithPeripheral:(CBPeripheral *)peripheral
{
    self = [super init];
    if (self) {
        self.peripheral = peripheral;
        self.name = peripheral.name;
//        self.peripheral.delegate = self;
    }
    return self;
}

- (CBPeripheral *)getPeripheral {
    return self.peripheral;
}

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
