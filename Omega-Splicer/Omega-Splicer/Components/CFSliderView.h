//
//  CFSliderView.h
//  CFSliderView
//
//  Created by Charles-Adrien Fournier on 02/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFSliderView : UIView

- (void)buildSlider;

- (void)buildSliderWithValue:(NSInteger) value;

- (NSInteger)getSliderValue;

- (void)setSliderValue:(NSInteger) value;

- (void)setSliderColor:(UIColor *)sliderColor;

- (void)setTextColor:(UIColor *)textColor;

@end
