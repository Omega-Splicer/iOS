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

- (void)setMovementUpdateInterval:(CGFloat)interval;

- (void)setThumbImage:(UIImage *)thumbImage andBGImage:(UIImage *)bgImage;

- (void)setMoveViscosity:(CGFloat)mv andSmallestValue:(CGFloat)sv;

@end

@protocol JoystickDelegate <NSObject>
@optional

- (void)joystick:(OSJoystick *)aJoysick didUpdate:(CGPoint)movement;

@end