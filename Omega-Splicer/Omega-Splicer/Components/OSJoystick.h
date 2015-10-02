//
//  OSJoystick.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 11/09/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol JoystickDelegate;

@interface OSJoystick : UIView

@property CGFloat updateInterval;

@property (weak) IBOutlet id<JoystickDelegate> delegate;

/**
 *  Set the movement update interval
 *
 *  @param interval The movement update interval
 */
- (void)setMovementUpdateInterval:(CGFloat)interval;

/**
 *  Set the thumb and background image for the joystick
 *
 *  @param thumbImage The thumb image
 *  @param bgImage    The background image
 */
- (void)setThumbImage:(UIImage *)thumbImage andBGImage:(UIImage *)bgImage;

/**
 *  Set the viscosity of the joystick
 *
 *  @param mv Move Viscosity
 *  @param sv Smallest Value
 */
- (void)setMoveViscosity:(CGFloat)mv andSmallestValue:(CGFloat)sv;

@end

@protocol JoystickDelegate <NSObject>
@optional

/**
 *  Notify the new position of the joystick
 *
 *  @param aJoysick The joystick
 *  @param movement The new position
 */
- (void)joystick:(OSJoystick *)aJoysick didUpdate:(CGPoint)movement;

@end