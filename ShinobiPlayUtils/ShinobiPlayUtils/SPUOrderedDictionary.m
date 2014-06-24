//
//  OrderedDictionary.m
//  ShinobiControlsTestApp
//
//  Created by  on 30/04/2012.
//  Copyright (c) 2012 Scott Logic. All rights reserved.
//

#import "SPUOrderedDictionary.h"

@implementation SPUOrderedDictionary

@synthesize dictionary;
@synthesize array;

- (id)init
{
  self = [super init];
  if (self != nil) {
    dictionary = [NSMutableDictionary dictionary];
    array = [NSMutableArray array];
  }
  return self;
}


+ (SPUOrderedDictionary*)dictionary {
  SPUOrderedDictionary *dictionary = [[SPUOrderedDictionary alloc] init];
  return dictionary;
}

- (void)setObject:(id)anObject forKey:(id)aKey {
  if (![dictionary objectForKey:aKey]) {
    [array addObject:aKey];
  }
  [dictionary setObject:anObject forKey:aKey];
}

- (void)removeObjectForKey:(id)aKey {
  [dictionary removeObjectForKey:aKey];
  [array removeObject:aKey];
}

- (NSUInteger)count {
  return dictionary.count;
}

- (id)objectForKey:(id)aKey {
  return [dictionary objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator
{
  return [array objectEnumerator];
}

- (id)keyAtIndex: (unsigned int)index    {
  return [array objectAtIndex:index];
}

- (id)objectAtIndex:(unsigned int)index {
  return [self objectForKey:[self keyAtIndex:index]];
}

@end
