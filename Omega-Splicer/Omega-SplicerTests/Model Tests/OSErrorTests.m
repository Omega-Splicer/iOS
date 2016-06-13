//
//  OSErrorTests.m
//  Omega-Splicer
//
//  Created by Charles Fournier on 05/06/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OSError.h"

@interface OSErrorTests : XCTestCase

@property (strong, nonatomic) OSError *error1;

@property (strong, nonatomic) OSError *error2;

@property (strong, nonatomic) OSError *error3;

@property (strong, nonatomic) OSError *error4;

@property (strong, nonatomic) OSError *error5;

@end

@implementation OSErrorTests

- (void)setUp {
    [super setUp];

    self.error1 = [[OSError alloc] initWithErrorCode:OSErrorBluetoothPoweredOff];
    
    self.error2 = [[OSError alloc] initWithErrorCode:OSErrorBluetoothUnauthorized];
    
    self.error3 = [[OSError alloc] initWithErrorCode:OSErrorBluetoothUnknown];
    
    self.error4 = [[OSError alloc] initWithErrorCode:OSErrorBluetoothUnsupported];

    self.error5 = [[OSError alloc] initWithErrorCode:6];
    
}

- (void)testError1 {
    XCTAssertEqualObjects(self.error1.name, @"Omega-Splicer requires Bluetooth");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



@end
