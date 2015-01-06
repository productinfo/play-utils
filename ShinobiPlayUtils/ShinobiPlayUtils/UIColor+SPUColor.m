//
//  UIColor+SPUColor.m
//  ShinobiPlayUtils
//
//  Created by Alison Clarke on 07/10/2014.
//
//  Copyright 2014 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "UIColor+SPUColor.h"

@implementation UIColor (SPUColor)

+ (UIColor *)shinobiRedColor {
  return [self colorWithHexString:@"#da290f" andAlpha:1.f];
}

+ (UIColor *)shinobiChartsPurpleColor {
  return [self colorWithHexString:@"#90095b" andAlpha:1.f];
}

+ (UIColor *)shinobiGridsOrangeColor {
  return [self colorWithHexString:@"#dd6b1d" andAlpha:1.f];
}

+ (UIColor *)shinobiEssentialsBlueColor {
  return [self colorWithHexString:@"#015184" andAlpha:1.f];
}

+ (UIColor *)shinobiGaugesGreenColor {
  return [self colorWithHexString:@"#066272" andAlpha:1.f];
}

+ (UIColor *)shinobiDarkGrayColor {
  return [UIColor colorWithRed:51.0/255 green:51.0/255 blue:51.0/255 alpha:1];
}

+ (UIColor*)colorWithHexValue:(uint)hexValue andAlpha:(CGFloat)alpha {
  return [UIColor
          colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
          green:((float)((hexValue & 0xFF00) >> 8))/255.0
          blue:((float)(hexValue & 0xFF))/255.0
          alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(CGFloat)alpha {
  UIColor *col;
  hexString = [hexString stringByReplacingOccurrencesOfString:@"#"
                                                   withString:@"0x"];
  uint hexValue;
  if ([[NSScanner scannerWithString:hexString] scanHexInt:&hexValue]) {
    col = [self colorWithHexValue:hexValue andAlpha:alpha];
  } else {
    // invalid hex string
    col = [self blackColor];
  }
  return col;
}

- (UIColor *)shinobiBackgroundColor {
  CGFloat h, s, b, a;
  if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
    
  return [UIColor colorWithHue:h
                      saturation:0.1
                      brightness:0.95
                           alpha:a];
  }
  return nil;
}

@end
