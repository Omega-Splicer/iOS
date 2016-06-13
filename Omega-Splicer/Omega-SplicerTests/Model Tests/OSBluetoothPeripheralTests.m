//
//  OSBluetoothPeripheralTests.m
//  Omega-Splicer
//
//  Created by Charles Fournier on 06/06/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSBluetoothPeripheral.h"

@interface OSBluetoothPeripheralTests : XCTestCase

@property (strong, nonatomic) OSBluetoothPeripheral *peripheral;

@end

@implementation OSBluetoothPeripheralTests

- (void)setUp {
    [super setUp];
    
    
    self.peripheral = [[OSBluetoothPeripheral alloc] initWithPeripheral:nil];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testPeripheral {
    
    XCTAssertNotNil(self.peripheral);
//    (void) self.peripheral.getPeripheral;
    CBService *service = [CBService alloc];
    CBCharacteristic *charac = [CBCharacteristic alloc];
    
    [self.peripheral peripheral:self.peripheral.getPeripheral didDiscoverServices:nil];
    [self.peripheral peripheral:self.peripheral.getPeripheral didDiscoverCharacteristicsForService:service error:nil];
    [self.peripheral peripheral:self.peripheral.getPeripheral didUpdateValueForCharacteristic:charac error:nil];
    
}

@end
