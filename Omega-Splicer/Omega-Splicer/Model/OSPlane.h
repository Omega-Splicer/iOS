//
//  OSFlight.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 18/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Model data
 */
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

/*!
 *  Update a OSPlane object with specific properties
 *
 *  @param name    expected name of the plane
 *  @param battery expected battery of the plane
 *  @param signal  expected signal of the plane
 *  @param motor   expected motor of the plane
 */
- (void)updatePlaneWithName:(NSString *)name battery:(float)battery signal:(float)signal motor:(float)motor;

/**
 *  Create an empty plane
 */
- (void)emptyPlane;

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
