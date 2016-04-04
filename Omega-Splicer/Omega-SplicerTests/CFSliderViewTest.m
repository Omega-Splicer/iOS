//
//  CFSliderViewTest.m
//  Omega-Splicer
//
//  Created by Charles-Adrien Fournier on 04/04/16.
//  Copyright © 2016 Charles-Adrien Fournier. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CFSliderView.h"

@interface CFSliderViewTest : XCTestCase

@property (strong, nonatomic) CFSliderView *sliderView;

@end

@implementation CFSliderViewTest

- (void)setUp {
    [super setUp];
 
    self.sliderView = [[CFSliderView alloc] init];
    [self.sliderView buildSliderWithValue:69];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSliderView {
    XCTAssertNotNil(self.sliderView, @"Slider view is nil");
    XCTAssertEqual(self.sliderView.getSliderValue, 69);
}

@end
