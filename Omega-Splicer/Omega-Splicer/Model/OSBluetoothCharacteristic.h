//
//  OSBluetoothCharacteristic.h
//  Omega-Splicer
//
//  Created by Charles Fournier on 18/07/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface OSBluetoothCharacteristic : NSObject

@property (strong, nonatomic) CBUUID *UUID;

@property (strong, nonatomic) NSData *value;

- (instancetype)initWithCharacteristic:(CBCharacteristic *)characteristic;

@end
