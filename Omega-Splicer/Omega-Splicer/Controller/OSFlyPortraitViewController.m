//
//  OSFlyPortraitViewController.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 05/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSFlyPortraitViewController.h"
#import "CFSliderView.h"

@interface OSFlyPortraitViewController ()

@property (weak, nonatomic) IBOutlet CFSliderView *sliderView;

@property (weak, nonatomic) IBOutlet UIButton *settingsButton;

@end

@implementation OSFlyPortraitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.settingsButton.tintColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];

}

- (void)viewDidAppear:(BOOL)animated {
    [self.sliderView buildSlider];
    [self.sliderView setTextColor:[UIColor whiteColor]];
    [self.sliderView setSliderColor:[UIColor colorWithRed:0.08 green:0.2 blue:0.35 alpha:1]];
    [self.sliderView setBackgroundColor:[UIColor colorWithRed:0.08 green:0.2 blue:0.35 alpha:0.7]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)closeButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
