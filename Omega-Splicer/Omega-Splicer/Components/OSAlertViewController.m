//
//  OSAlertViewController.m
//  Omega-Splicer
//
//  Created by Charles Fournier on 05/05/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import "OSAlertViewController.h"

@interface OSAlertViewController ()

@end

@implementation OSAlertViewController

+ (instancetype) alertControllerWithError:(OSError *)error {
    OSAlertViewController *alertViewController = [OSAlertViewController alertControllerWithTitle:error.name message:error.details preferredStyle:UIAlertControllerStyleAlert];
    alertViewController.error = error;
    [alertViewController setupAlertActions];
    return alertViewController;
}

- (void)setupAlertActions {
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.error.navigationState == OSNavigationBack && self.delegate)
            [self.delegate alertViewControllerDidRequiresToPopViewController:self];
    }];
    [self addAction:defaultAction];
    
    if (self.error.urlScheme && self.error.urlSchemeName) {
        UIAlertAction *goAction = [UIAlertAction actionWithTitle:self.error.urlSchemeName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [[UIApplication sharedApplication] openURL:self.error.urlScheme];
            if (self.delegate)
                [self.delegate alertViewControllerDidRequiresToPopViewController:self];
        }];
        [self addAction:goAction];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
