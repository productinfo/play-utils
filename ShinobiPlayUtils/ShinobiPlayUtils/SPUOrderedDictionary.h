//
//  OrderedDictionary.h
//  ShinobiControlsTestApp
//
//  Created by  on 30/04/2012.
//  Copyright (c) 2012 Scott Logic. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
   A mutable dictionary which maintains ordering of its keys.  The implementation is based on the blog post from Matt Gallagher (http://cocoawithlove.com/2008/12/ordereddictionary-subclassing-cocoa.html).
 */
@interface SPUOrderedDictionary : NSMutableDictionary

@property (nonatomic, strong, readonly) NSMutableDictionary *dictionary;
@property (nonatomic, strong, readonly) NSMutableArray *array;

- (id)keyAtIndex: (unsigned int)index;
- (id)objectAtIndex: (unsigned int)index;

@end
