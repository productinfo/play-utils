//
//  SPUManagedGalleryViewController.h
//  ShinobiPlayUtils
//
//  Created by Alison Clarke on 24/06/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

@import UIKit;

@interface SPUGalleryManagedViewController : UIViewController

- (instancetype)initWithViewFrame:(CGRect)frame;
+ (instancetype)viewControllerFromStoryboard:(NSString*)storyboardName viewFrame:(CGRect)frame;

@end
