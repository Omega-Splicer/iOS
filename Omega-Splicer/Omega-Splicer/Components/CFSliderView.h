//
//  CFSliderView.h
//  CFSliderView
//
//  Created by Charles-Adrien Fournier on 02/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CFSliderView : UIView

/**
 *  Method used to build the slider with default value
 */
- (void)buildSlider;

/**
 *  Mehtod used to build the slider with selected value
 *
 *  @param expected value slider value
 */
- (void)buildSliderWithValue:(NSInteger) value;

/**
 *  Return the actual slider value
 *
 *  @return actual slider value
 */
- (NSInteger)getSliderValue;

/**
 *  Set the slider value
 *
 *  @param value expected slider value
 */
- (void)setSliderValue:(NSInteger) value;

/**
 *  Set the slider color
 *
 *  @param sliderColor expected slider color
 */
- (void)setSliderColor:(UIColor *)sliderColor;

/**
 *  Set the slider text color
 *
 *  @param textColor expected slider text color
 */
- (void)setTextColor:(UIColor *)textColor;

@end
