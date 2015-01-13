//
//  UIFont+SPUFont.m
//  ShinobiPlayUtils
//
//  Created by Alison Clarke on 06/01/2015.
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