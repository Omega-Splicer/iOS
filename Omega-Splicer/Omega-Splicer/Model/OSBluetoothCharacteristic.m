//
//  OSBluetoothCharacteristic.m
//  Omega-Splicer
//
//  Created by Charles Fournier on 18/07/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import "OSBluetoothCharacteristic.h"

@interface OSBluetoothCharacteristic()

@property (strong, nonatomic) CBCharacteristic *characteristic;

@end

@implementation OSBluetoothCharacteristic

- (instancetype)initWithCharacteristic:(CBCharacteristic *)characteristic {
    self = [super init];
    if (self) {
        self.characteristic = characteristic;
        self.UUID = characteristic.UUID;
        self.value = characteristic.value;
    }
    return self;
}

@end
