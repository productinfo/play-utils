//
//  SPUGalleryManagedChartViewController.m
//  ShinobiPlayUtils
//
//  Created by Alison Clarke on 29/09/2014.
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

#import "SPUGalleryManagedChartViewController.h"

@interface SPUGalleryManagedChartViewController ()

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
  self.chartFrame = CGRectInset(self.view.bounds, 20, 20);
  [self createChart];
  [self createDataSource];
  self.chart.datasource = self.dataSource;
  self.chart.delegate = self;
  [self setupChart];
  
  // Chart may have already been added by a storyboard
  if (![self.chart isDescendantOfView:self.view]) {
    [self.view addSubview:self.chart];
  }
  
  self.selectedDonutIndices = [NSMutableDictionary new];
  self.rotations = [NSMutableDictionary new];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  
  // Recreate the chart if necessary
  if (!self.chart) {
    [self createChart];
    self.chart.frame = self.chartFrame;
    
    [self createDataSource];
    self.chart.datasource = self.dataSource;
    self.chart.delegate = self;
    [self setupChart];    
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

#pragma mark - lifecycle methods that can be implemented in subclasses

- (void)createChart {
  // Add an implementation in subclasses if the chart isn't created in a xib
  if (!self.chart) { 
    self.chart = [[ShinobiChart alloc] initWithFrame:self.chartFrame];
  }
}

- (void)createDataSource {
  // Must be implemented in subclass, to set self.datasource
  [self doesNotRecognizeSelector:_cmd];
}

- (void)setupChart {
  // Add an implementation in subclasses for any chart setup code that should be called
  // when a chart is recreated
}

- (void)setupAfterDataLoad {
  // Add an implementation in subclasses for any chart setup code that should be called
  // after the ranges etc have been restored
}

#pragma mark - SChartDelegate methods

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
        // Grab the appropriate data point and set it to be selected
        // NB: the docs tell you not to modify the data in SChartSeries.dataSeries but:
        // a) we can't really change the data source from here - we don't want to have
        // the charts based on this superclass to concern themselves with preserving the
        // chart state
        // b) we're not actually changing the data itself so we don't need to worry about
        // inconsistencies with the data source
        SChartDataPoint *dp = series.dataSeries.dataPoints[[index integerValue]];
        dp.selected = YES;
      }
      donutSeries.style.initialRotation = self.rotations[seriesIndex];
    }
  }
  
  [self setupAfterDataLoad];
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
