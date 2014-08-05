//
//  SPUManagedGalleryViewController.m
//  ShinobiPlayUtils
//
//  Created by Alison Clarke on 24/06/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "SPUGalleryManagedViewController.h"

@interface SPUGalleryManagedViewController ()

@property (nonatomic, assign) CGRect frame;

@end

@implementation SPUGalleryManagedViewController

- (instancetype)initWithViewFrame:(CGRect)frame {
  self = [super init];
  if (self) {
    self.frame = frame;
  }
  return self;
}

+ (instancetype)viewControllerFromStoryboard:(NSString*)storyboardName viewFrame:(CGRect)frame {
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
  SPUGalleryManagedViewController *vc = [storyboard instantiateInitialViewController];
  vc.frame = frame;
  return vc;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  if (!CGRectIsEmpty(self.frame)) {
    self.view.frame = self.frame;
  }
}

@end
