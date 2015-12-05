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

@end

@implementation OSFlyPortraitViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewDidAppear:(BOOL)animated {
    [self.sliderView buildSlider];
    [self.sliderView setTextColor:[UIColor colorWithRed:0.29 green:0.29 blue:0.29 alpha:1]];
    [self.sliderView setSliderColor:[UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1]];
    [self.sliderView setBackgroundColor:[UIColor colorWithRed:0.56 green:0.56 blue:0.56 alpha:1]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)closeButtonClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
