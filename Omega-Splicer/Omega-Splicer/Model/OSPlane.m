//
//  OSFlight.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 18/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSPlane.h"

@implementation OSPlane

- (void)initEmptyPlane {
    self.name = @"Empty plane";
    self.signal = 0;
    self.battery = 0;
}

- (void)initPlaneWithName:(NSString *)name battery:(float)battery signal:(float)signal {
    if (![name isEqualToString:@""])
        self.name = name;
    
    if (self.battery >= 0)
        self.battery = battery;
    else
        self.battery = 0;

    if (self.signal >= 0)
        self.signal = signal;
    else
        self.signal = 0;
}

- (void)planeExample1 {
    self.name = @"First example plane";
    self.battery = 100;
    self.signal = 100;
}

- (void)planeExample2 {
    self.name = @"Second example plane";
    self.battery = 50;
    self.signal = 50;
}

- (void)planeExample3 {
    self.name = @"Third example plane";
    self.battery = 0;
    self.signal = 0;
}

@end
