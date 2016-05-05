//
//  OSError.m
//  Omega-Splicer
//
//  Created by Charles Fournier on 03/05/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import "OSError.h"

@implementation OSError

- (instancetype)initWithErrorCode:(OSErrorCode)errorCode {
    self = [super init];
    if (self) {
        self.errorCode = errorCode;
        switch (errorCode) {
            case OSErrorBluetoothUnknown:
                self.name = @"Omega-Splcier requires Bluetooth";
                self.details = @"It seems that your device is not compatible.";
                self.navigationState = OSNavigationBack;
                break;
                
            case OSErrorBluetoothPoweredOff:
                self.name = @"Omega-Splicer requires Bluetooth";
                self.details = @"Please enable Bluetooth to coninue using this app.";
                self.urlScheme = [NSURL URLWithString:@"prefs:root=Bluetooth"];
                self.urlSchemeName = @"Settings";
                self.navigationState = OSNavigationBack;
                break;
                
            case OSErrorBluetoothUnsupported:
                self.name = @"Omega-Splicer requires Bluetooth";
                self.details = @"It seems that your device is not compatible.";
                self.navigationState = OSNavigationBack;
                break;
                
            case OSErrorBluetoothUnauthorized:
                self.name = @"Omega-Splcier requires Bluetooth";
                self.details = @"Please authorize Omega-Splicer to use bluetooth.";
                self.urlScheme = [NSURL URLWithString:@"prefs:root=Bluetooth"];
                self.urlSchemeName = @"Settings";
                self.navigationState = OSNavigationBack;
                break;
                
            default:
                break;
        }
    }
    return self;
    
}

@end
