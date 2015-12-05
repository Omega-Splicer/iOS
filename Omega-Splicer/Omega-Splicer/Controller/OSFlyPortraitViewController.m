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

- (void)viewWillAppear:(BOOL)animated {
//    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
//    [UINavigationBar appearance].tintColor = [UIColor colorWithRed:0.56 green:0.56 blue:0.56 alpha:1];
//    [self.view addSubview:navBar];
//    
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:nil];
////    UIBarButtonItem *settingsItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStyleDone target:self action:nil];
//    UIBarButtonItem *settingsItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_settings_48pt"] style:UIBarButtonItemStyleDone target:self action:nil];
//    settingsItem.width = 15;
//
//    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@""];
//    navigItem.rightBarButtonItem = settingsItem;
//    navigItem.leftBarButtonItem = backItem;
//    
//    navBar.items = [NSArray arrayWithObjects:navigItem, nil];
//    [UIBarButtonItem appearance].tintColor = [UIColor colorWithRed:0.85 green:0.85 blue:0.85 alpha:1];
    
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
