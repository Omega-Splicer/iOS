//
//  OSFlight.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 18/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSPlane.h"

@implementation OSPlane

- (void)updatePlaneWithName:(NSString *)name battery:(float)battery signal:(float)signal motor:(float)motor {

    if (![name isEqualToString:@""])
        self.name = name;
    
    self.battery = 0;
    self.motor = 0;
    self.signal = 0;
    
    if (battery >= 0)
        self.battery = battery;
    
    if (signal >= 0)
        self.signal = signal;
    
    if (motor >= 0)
        self.motor = motor;
}

- (void)emptyPlane {
    self.name = @"";
    self.signal = 0;
    self.battery = 0;
    self.motor = 0;
}

- (void)planeExample1 {
    self.name = @"First example plane";
    self.battery = 100;
    self.signal = 100;
    self.motor = 100;
}

- (void)planeExample2 {
    self.name = @"Second example plane";
    self.battery = 50;
    self.signal = 50;
    self.motor = 50;
}

- (void)planeExample3 {
    self.name = @"Third example plane";
    self.battery = 0;
    self.signal = 0;
    self.motor = 0;
}

@end
