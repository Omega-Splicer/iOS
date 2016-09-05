//
//  OSError.h
//  Omega-Splicer
//
//  Created by Charles Fournier on 03/05/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OSNavigationState) {
    OSNavigationBack = 1,
    OSNavigationOk = 2
};

typedef NS_ENUM(NSInteger, OSErrorCode) {
    OSErrorBluetoothPoweredOff = 1,
    OSErrorBluetoothUnauthorized = 2,
    OSErrorBluetoothUnknown = 3,
    OSErrorBluetoothUnsupported = 4,
    OSErrorDeviceUnsupported = 5,
    OSErrorDeviceConnection = 6
    
};

@interface OSError : NSObject

- (instancetype)initWithErrorCode:(OSErrorCode)errorCode;

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) NSString *details;

@property (strong, nonatomic) NSString *urlSchemeName;

@property (strong, nonatomic) NSURL *urlScheme;

@property (strong, nonatomic) NSError *error;

@property (nonatomic) OSErrorCode errorCode;

@property (nonatomic) OSNavigationState navigationState;



@end
