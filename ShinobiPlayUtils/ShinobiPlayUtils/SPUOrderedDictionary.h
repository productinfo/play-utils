//
//  OrderedDictionary.h
//  ShinobiControlsTestApp
//
//  Created by  on 30/04/2012.
//  Copyright (c) 2012 Scott Logic. All rights reserved.
//

@import Foundation;

/**
   A mutable dictionary which maintains ordering of its keys.  The implementation is based on the blog post from Matt Gallagher (http://cocoawithlove.com/2008/12/ordereddictionary-subclassing-cocoa.html).
 */
@interface SPUOrderedDictionary : NSMutableDictionary

- (id)keyAtIndex:(NSUInteger)index;
- (id)objectAtIndex:(NSUInteger)index;

@end
