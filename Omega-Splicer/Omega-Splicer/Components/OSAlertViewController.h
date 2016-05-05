//
//  OSAlertViewController.h
//  Omega-Splicer
//
//  Created by Charles Fournier on 05/05/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSError.h"

@protocol OSAlertViewControllerDelegate;

@interface OSAlertViewController : UIAlertController

+ (instancetype) alertControllerWithError:(OSError *)error;

@property (strong, nonatomic) OSError *error;

@property (weak) IBOutlet id<OSAlertViewControllerDelegate> delegate;

@end

@protocol OSAlertViewControllerDelegate <NSObject>

- (void)alertViewControllerDidRequiresToPopViewController:(OSAlertViewController *)alertViewController ;

@end