//
//  UIFont+SPUFont.m
//  ShinobiPlayUtils
//
//  Created by Alison Clarke on 06/01/2015.
//  Copyright (c) 2015 Alison Clarke. All rights reserved.
//

#import "UIFont+SPUFont.h"

@implementation UIFont (SPUFont)

+ (UIFont *)shinobiFontOfSize:(CGFloat)fontSize {
  return [UIFont fontWithName:@"HelveticaNeue-Thin" size:fontSize];
}

+ (UIFont *)lightShinobiFontOfSize:(CGFloat)fontSize {
  return [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:fontSize];
}

+ (UIFont *)boldShinobiFontOfSize:(CGFloat)fontSize {
  return [UIFont fontWithName:@"HelveticaNeue-Light" size:fontSize];
}

@end
