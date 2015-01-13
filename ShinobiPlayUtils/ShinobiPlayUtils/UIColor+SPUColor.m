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

static NSArray *shinobiPlayColors;

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

+ (UIColor *)shinobiPlayBlueColor {
  return [UIColor colorWithRed:1/255.f *.8 green:122/255.f *.8 blue:255/255.f *.8 alpha:1.f];
}

+ (UIColor *)shinobiPlayGreenColor {
  return [UIColor colorWithRed:76/255.f *.8 green:217/255.f *.8 blue:100/255.f *.8 alpha:1.f];
}

+ (UIColor *)shinobiPlayOrangeColor {
  return [UIColor colorWithRed:255/255.f *.9 green:149/255.f *.9 blue:1/255.f *.9 alpha:1.f];
}

+ (UIColor *)shinobiPlayRedColor {
  return [UIColor colorWithRed:255/255.f *.9 green:45/255.f *.9 blue:85/255.f *.9 alpha:1.f];
}

+ (UIColor *)shinobiPlayPurpleColor {
  return [UIColor colorWithRed:88/255.f *.8 green:86/255.f *.8 blue:214/255.f *.8 alpha:1.f];
}

+ (UIColor *)shinobiPlaySilverColor {
  return [UIColor colorWithRed:142/255.f green:142/255.f blue:147/255.f alpha:1.f];
}

+ (NSArray *)shinobiPlayColorArray {
  static dispatch_once_t onceToken = 0;
  dispatch_once(&onceToken, ^{
    shinobiPlayColors = @[[UIColor shinobiPlayBlueColor],
                          [UIColor shinobiPlayGreenColor],
                          [UIColor shinobiPlayOrangeColor],
                          [UIColor shinobiPlayRedColor],
                          [UIColor shinobiPlayPurpleColor],
                          [UIColor shinobiPlaySilverColor]];
  });
  
  return shinobiPlayColors;
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

- (UIColor *)shinobiLightColor {
  CGFloat h, s, b, a;
  if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
    
    return [UIColor colorWithHue:h
                      saturation:0.5
                      brightness:0.8
                           alpha:a];
  }
  return nil;
}

@end
