//
//  OSFlight.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 18/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OSPlane : NSObject

/**
 *  Plane name
 */
@property (nonatomic, strong) NSString *name;

/**
 *  Plane battery level
 */
@property (nonatomic) float battery;

/**
 *  Plane signal level
 */
@property (nonatomic) float signal;

/**
 *  Plane motor power
 */
@property (nonatomic) float motor;

/**
 *  Initialize an empty plane
 */
- (void)initEmptyPlane;

/**
 *  Initialize a plane with specific name, battery and signal
 *
 *  @param name    expected name of the plane
 *  @param battery expected battery level of the plane
 *  @param signal  expected signal level of the plane
 */
- (void)initPlaneWithName:(NSString *)name battery:(float)battery signal:(float)signal;

/**
 *  Create example plane 1
 */
- (void)planeExample1;

/**
 *  Create example plane 2
 */
- (void)planeExample2;

/**
 *  Create example plane 3
 */
- (void)planeExample3;

@end
