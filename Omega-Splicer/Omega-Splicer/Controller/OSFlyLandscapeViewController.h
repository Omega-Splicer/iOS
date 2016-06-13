//
//  FlyViewController.h
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 09/09/15.
//  Copyright (c) 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "OSJoystick.h"

@interface OSFlyLandscapeViewController : UIViewController <JoystickDelegate>

- (void)displayJoystick;

- (void)removeJoystick;

@end