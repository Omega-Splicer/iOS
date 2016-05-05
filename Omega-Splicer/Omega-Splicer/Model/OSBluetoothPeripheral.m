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
    }
    return self;
}

@end
