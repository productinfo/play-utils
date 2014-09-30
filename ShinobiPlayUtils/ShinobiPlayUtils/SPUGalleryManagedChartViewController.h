//
//  SPUGalleryManagedChartViewController.h
//  ShinobiPlayUtils
//
//  Created by Alison Clarke on 29/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "SPUGalleryManagedViewController.h"
#import <ShinobiCharts/ShinobiCharts.h>

@interface SPUGalleryManagedChartViewController : SPUGalleryManagedViewController<SChartDelegate>

@property (strong, nonatomic) IBOutlet ShinobiChart *chart;
@property (strong, nonatomic) NSObject<SChartDatasource> *dataSource;

- (void)createChart;
- (void)createDataSource;
- (void)setupChart;
- (void)setupAfterDataLoad;

@end
