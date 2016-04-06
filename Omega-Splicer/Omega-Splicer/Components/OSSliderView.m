//
//  CFSliderView.m
//  CFSliderView
//
//  Created by Charles-Adrien Fournier on 02/12/15.
//  Copyright © 2015 Charles-Adrien Fournier. All rights reserved.
//

#import "OSSliderView.h"

@interface OSSliderView()

@property (nonatomic, strong) UIView *overlay;

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic) NSInteger value;

@end

@implementation OSSliderView

- (void)buildSlider {
    [self buildSliderWithValue:200];
}

- (void)buildSliderWithValue:(NSInteger)value {
    
    if (value > 100 ||  value < 0)
        self.value = 50;
    else
        self.value = value;
        
    self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height)];
    self.overlay.backgroundColor = [UIColor redColor];
    [self addSubview:self.overlay];
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.text = [NSString stringWithFormat:@"%ld%%", (long)self.value];
    self.textLabel.font = [self.textLabel.font fontWithSize:25];
    [self addSubview:self.textLabel];
}

- (NSInteger)getSliderValue {
    return self.value;
}

- (void)setSliderValue:(NSInteger)value {
    CGFloat newValue;
    newValue = (self.frame.size.width / 100) * value;
    [self updateSliderWithValue:newValue];
}

- (void)setTextColor:(UIColor *)textColor {
    self.textLabel.textColor = textColor;
}

- (void)setSliderColor:(UIColor *)sliderColor {
    self.overlay.backgroundColor = sliderColor;
}

- (void)updateSliderWithValue:(CGFloat)value {
    [self.overlay setFrame:CGRectMake(0, 0, value, self.overlay.frame.size.height)];
    NSInteger percentageValue = (value / self.frame.size.width) * 100;
    self.textLabel.text = [NSString stringWithFormat:@"%ld%%", (long)percentageValue];
    self.value = percentageValue;
}


#pragma mark - Touches actions

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    [self updateSliderWithValue:touchLocation.x];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    [self updateSliderWithValue:touchLocation.x];
}

@end
