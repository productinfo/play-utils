//
//  SPUGalleryManagedChartViewController.m
//  ShinobiPlayUtils
//
//  Created by Alison Clarke on 29/09/2014.
//  Copyright (c) 2014 Alison Clarke. All rights reserved.
//

#import "SPUGalleryManagedChartViewController.h"

@interface SPUGalleryManagedChartViewController ()

@property (strong, nonatomic) NSObject<SChartDatasource> *dataSource;
@property (strong, nonatomic) NSMutableArray *ranges;
@property (strong, nonatomic) NSMutableDictionary *selectedDonutIndices;
@property (strong, nonatomic) NSMutableDictionary *rotations;
@property (assign, nonatomic) CGRect chartFrame;

@end

/**
 A chart view controller for ShinobiPlay that tears down the chart when the view disappears and
 restores it when it reappears. To enable this, it sets itself as the chart's delegate.
 */
@implementation SPUGalleryManagedChartViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.chart.delegate = self;
  self.dataSource = [self createDataSource];
  self.chart.datasource = self.dataSource;
  self.selectedDonutIndices = [NSMutableDictionary new];
  self.rotations = [NSMutableDictionary new];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  // Recreate the chart if necessary
  if (!self.chart) {
    self.chart = [[ShinobiChart alloc] initWithFrame:self.chartFrame];
    self.dataSource = [self createDataSource];
    self.chart.datasource = self.dataSource;
    self.chart.delegate = self;
    [self.view addSubview:self.chart];
  }
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
  
  // Save the current state
  self.chartFrame = self.chart.frame;
  self.ranges = [NSMutableArray new];
  for (SChartAxis *axis in self.chart.allAxes) {
    [self.ranges addObject:axis.axisRange];
  }
  
  for (NSInteger i=0; i < self.chart.series.count; i++) {
    SChartSeries* series = self.chart.series[i];
    if ([series isKindOfClass:[SChartDonutSeries class]]) {
      self.rotations[@(i)] = @(((SChartDonutSeries *)series).rotation);
    }
  }
  
  // Throw away the chart and datasource
  [self.chart removeFromSuperview];
  self.chart = nil;
  self.dataSource = nil;
}

-(id<SChartDatasource>)createDataSource {
  // Must be implemented in subclass
  [self doesNotRecognizeSelector:_cmd];
  return nil;
}

- (void)sChartDidFinishLoadingData:(ShinobiChart *)chart {
  // Restore the previous state of the chart
  
  // Ranges first
  if (self.ranges) {
    for (int i=0; i<self.chart.allAxes.count && i<self.ranges.count; i++) {
      if (self.ranges[i]) {
        SChartRange *range = (SChartRange *)self.ranges[i];
        [self.chart.allAxes[i] setRangeWithMinimum:range.minimum andMaximum:range.maximum];
      }
    }
  }
  
  // Now donut series selection and rotation (if applicable)
  for (NSInteger i=0; i < self.chart.series.count; i++) {
    SChartSeries* series = self.chart.series[i];
    NSNumber *seriesIndex = @(i);
    if ([series isKindOfClass:[SChartDonutSeries class]] && self.selectedDonutIndices[seriesIndex]) {
      SChartDonutSeries *donutSeries = (SChartDonutSeries *) series;
      for (NSNumber *index in self.selectedDonutIndices[seriesIndex]) {
        [donutSeries setSlice:[index integerValue] asSelected:YES];
      }
      donutSeries.style.initialRotation = self.rotations[seriesIndex];
    }
  }
}

- (void)sChart:(ShinobiChart *)chart toggledSelectionForRadialPoint:(SChartRadialDataPoint *)dataPoint
      inSeries:(SChartRadialSeries *)series atPixelCoordinate:(CGPoint)pixelPoint {
  // Keep track of the selected indices
  NSNumber *seriesIndex = @([chart.series indexOfObject:series]);
  if (!self.selectedDonutIndices[seriesIndex]) {
    self.selectedDonutIndices[seriesIndex] = [NSMutableArray new];
  }
  
  if (dataPoint.selected) {
    [self.selectedDonutIndices[seriesIndex] addObject:@(dataPoint.index)];
  } else {
    [self.selectedDonutIndices[seriesIndex] removeObject:@(dataPoint.index)];
  }
}


@end
