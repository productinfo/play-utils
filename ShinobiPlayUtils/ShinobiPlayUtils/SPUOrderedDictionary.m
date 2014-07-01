//
//  OrderedDictionary.m
//  ShinobiControlsTestApp
//
//  Created by  on 30/04/2012.
//  Copyright (c) 2012 Scott Logic. All rights reserved.
//

#import "SPUOrderedDictionary.h"

@interface SPUOrderedDictionary ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation SPUOrderedDictionary

- (instancetype)init {
  self = [super init];
  if (self != nil) {
    self.dictionary = [NSMutableDictionary dictionary];
    self.array = [NSMutableArray array];
  }
  return self;
}

+ (instancetype)dictionary {
  return [[[SPUOrderedDictionary class] alloc] init];
}

- (void)setObject:(id)anObject forKey:(id)aKey {
  if (![self.dictionary objectForKey:aKey]) {
    [self.array addObject:aKey];
  }
  [self.dictionary setObject:anObject forKey:aKey];
}

- (void)removeObjectForKey:(id)aKey {
  [self.dictionary removeObjectForKey:aKey];
  [self.array removeObject:aKey];
}

- (NSUInteger)count {
  return self.dictionary.count;
}

- (id)objectForKey:(id)aKey {
  return [self.dictionary objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator {
  return [self.array objectEnumerator];
}

- (id)keyAtIndex:(NSUInteger)index    {
  return [self.array objectAtIndex:index];
}

- (id)objectAtIndex:(NSUInteger)index {
  return [self objectForKey:[self keyAtIndex:index]];
}

@end
