//
//  OSFlight.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 18/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OSPlane : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic) float battery;

@property (nonatomic) float signal;

@property (nonatomic) float motor;

- (void)initEmptyPlane;

- (void)initPlaneWithName:(NSString *)name battery:(float)battery signal:(float)signal;

- (void)planeExample1;

- (void)planeExample2;

- (void)planeExample3;

@end
