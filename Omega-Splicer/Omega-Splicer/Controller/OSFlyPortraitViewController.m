//
//  OSFlyPortraitViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 05/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <CoreMotion/CoreMotion.h>
#import "OSFlyPortraitViewController.h"
#import "OSSliderView.h"
#import "MONActivityIndicatorView.h"
#import "OSAlertViewController.h"

@interface OSFlyPortraitViewController () <OSAlertViewControllerDelegate>

@property (weak, nonatomic) IBOutlet OSSliderView *sliderView;

@property (strong, nonatomic) CMMotionManager *motionManager;

@property (weak, nonatomic) IBOutlet UIImageView *planeImageView;

@property (nonatomic) CGFloat xGravity;

@property (weak, nonatomic) IBOutlet MONActivityIndicatorView *indicatorView;

@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;

@property (nonatomic) BOOL isLoading;

@end

@implementation OSFlyPortraitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMotionManager];
    self.isLoading = true;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.sliderView buildSlider];
    [self.sliderView updateConstraintsIfNeeded];
    [self.sliderView setTextColor:[UIColor whiteColor]];
    [self.sliderView setSliderColor:[UIColor colorWithRed:0.21 green:0.21 blue:0.21 alpha:1.00]];
    [self.sliderView setBackgroundColor:[UIColor colorWithRed:0.32 green:0.32 blue:0.32 alpha:0.7]];
    
    [self deviceCheck];
    
    //    [self startMotionManager];
}

- (void)deviceCheck {
    [self.indicatorView startAnimating];
    self.isLoading = true;
    [self.indicatorView setCenter:CGPointMake(self.view.center.x, self.indicatorView.center.y)];
    self.planeImageView.hidden = true;
    [self.bluetoothManager connectPeripheral:self.peripheral];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self stopMotionManager];
}

#pragma mark - Motion manager

- (void)setupMotionManager {
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.deviceMotionUpdateInterval = 0.01f;
}

- (void)startMotionManager {
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        [self updateMotionManagerData:motion];
    }];
}

- (void)updateMotionManagerData:(CMDeviceMotion *)motion {
    self.xGravity = motion.gravity.x;
}

- (void)stopMotionManager {
    [self.motionManager stopDeviceMotionUpdates];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isLoading == true)
        return;
    CBCharacteristic *tmpCharac = [self.bluetoothManager getCharacteristicForUUID:[CBUUID UUIDWithString:UUID_READ_CHARACTERISTIC]];
    char *value = "m1:42/m2:24";
    NSData *sendData = [NSData dataWithBytes:value length:strlen(value)];
    [self.bluetoothManager writeValue:sendData forCharacteristic:tmpCharac];
}

#pragma mark - Bluetooth Manager delegate

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didConnectToPeripheral:(CBPeripheral *)peripheral {
    
}

- (void)bluetoothManager:(OSBluetoothManager *)bluetoothManager didFailToConnect:(OSError *)error {
    OSAlertViewController *alertViewController = [OSAlertViewController alertControllerWithError:error];
    alertViewController.delegate = self;
    [self presentViewController:alertViewController animated:YES completion:nil];
}

- (void)bluetootManager:(OSBluetoothManager *)bluetoothManager isReadyWithPeripheral:(CBPeripheral *)peripheral {
    [self.indicatorView stopAnimating];
    self.isLoading = false;
    [self.indicatorLabel setHidden:true];
    [self.planeImageView setHidden:false];
}


#pragma mark - OSAlertViewController delegate

- (void)alertViewControllerDidRequiresToPopViewController:(OSAlertViewController *)alertViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
