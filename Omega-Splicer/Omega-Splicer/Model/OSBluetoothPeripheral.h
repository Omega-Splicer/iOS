//
//  OSBluetoothPeripheral.h
//  Omega-Splicer
//
//  Created by Charles Fournier on 02/05/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface OSBluetoothPeripheral : NSObject  <CBPeripheralDelegate>

@property (strong, nonatomic) NSString *name;

- (instancetype)initWithPeripheral:(CBPeripheral *)peripheral;

- (CBPeripheral *)getPeripheral;

@end
