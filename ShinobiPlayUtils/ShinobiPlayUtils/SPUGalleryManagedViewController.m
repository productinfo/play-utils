//
//  SPUManagedGalleryViewController.m
//  ShinobiPlayUtils
//
//  Created by Alison Clarke on 24/06/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "SPUGalleryManagedViewController.h"

@interface SPUGalleryManagedViewController ()

@property CGRect frame;

@end

@implementation SPUGalleryManagedViewController

- (id)initWithViewFrame:(CGRect)frame {
  self = [super init];
  if (self) {
    self.frame = frame;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  if (!CGRectIsEmpty(self.frame)) {
    self.view.frame = self.frame;
  }
}

@end
