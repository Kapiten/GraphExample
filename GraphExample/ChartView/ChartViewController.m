//
//  ChartViewController.m
//  CalculatorObjC
//
//  Created by Admin on 2024/01/19.
//

#import <Foundation/Foundation.h>
#import "ChartViewController.h"
#import <PNChart/PNChart.h>
#import "MainUtil.h"
#import "MiDictionary.h"

@interface ChartViewController ()

@end

@implementation ChartViewController
MainUtil *mainUtil;

- (void)viewDidLoad {
    [super viewDidLoad];
    mainUtil = [[MainUtil alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@%@", @"ChartType: ", [mainUtil.dData valueForKey:@"chart_type"]);
    if([[[NSString alloc] initWithString:[mainUtil.dData valueForKey:@"chart_type"]] isEqualToString:@"Line"]) {[self presentLineChart];}
    else if([[[NSString alloc] initWithString:[mainUtil.dData valueForKey:@"chart_type"]] isEqualToString:@"Bar"]) {[self presentBarChart];}
    else if([[[NSString alloc] initWithString:[mainUtil.dData valueForKey:@"chart_type"]] isEqualToString:@"Pie"]) {[self presentPieChart];}
    else if([[[NSString alloc] initWithString:[mainUtil.dData valueForKey:@"chart_type"]] isEqualToString:@"Circle"]) {[self presentCircleChart];}
    
}

- (void) presentLineChart {
    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 220.0)];
    NSArray *arrayLabel = ((MiDictionary*)[((MiDictionary*)[mainUtil.dData valueForKey:@"chart_data"]) valueForLabel:@"Week 1"]).allLabels;
    if(arrayLabel==nil||arrayLabel.count<1){arrayLabel=@[@"JAN",@"FEB",@"MAR",@"APR",@"MAY", @"JUN",@"JUL",@"AUG",@"SEP",@"OCT",@"NOV", @"DEC"];}
    [lineChart setXLabels:arrayLabel];

    // Line Chart No.1
    NSArray *data01Array = ((MiDictionary*)[((MiDictionary*)[mainUtil.dData valueForKey:@"chart_data"]) valueForLabel:@"Week 1"]).allValues;
    if(data01Array==nil||data01Array.count<1){data01Array = @[@120, @100, @90, @95, @92, @104, @98, @101, @98, @92, @85, @88, @84, @98];}
    //NSArray * data01Array = @[@120, @100, @90, @95, @92, @104, @98, @101, @98, @92, @85, @88, @84, @98];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    // Line Chart No.2
    NSArray *data02Array = ((MiDictionary*)[((MiDictionary*)[mainUtil.dData valueForKey:@"chart_data"]) valueForLabel:@"Week 2"]).allValues;
    if(data02Array==nil||data02Array.count<1){data02Array = @[@130, @105, @85, @92, @96, @108, @103, @98, @99, @94, @85, @82, @94, @103];}
        //NSArray * data02Array = @[@130, @105, @85, @92, @96, @108, @103, @98, @99, @94, @85, @82, @94, @103];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.color = PNTwitterColor;
    data02.itemCount = lineChart.xLabels.count;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = 0;
        if(index<data02Array.count){yValue = [data02Array[index] floatValue];}
        
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    lineChart.chartData = @[data01, data02];
    [lineChart strokeChart];
        lineChart.showYGridLines = YES;
        lineChart.yGridLinesColor = [UIColor grayColor];
        lineChart.showSmoothLines = YES;
    
    lineChart.delegate = self;
        [self.view addSubview:lineChart];
        
        data01.dataTitle = @"HomeDevice 1";
        data02.dataTitle = @"HomeDevice 2";
    

        //Build the legend
        lineChart.legendStyle = PNLegendItemStyleSerial;
        UIView *legend = [lineChart getLegendWithMaxWidth:SCREEN_WIDTH];

        //Move legend to the desired position and add to view
        [legend setFrame:CGRectMake(100, 400, legend.frame.size.width, legend.frame.size.height)];
        [self.view addSubview:legend];


        //Move legend to the desired position and add to view
        [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
}

- (void) presentBarChart {
    PNBarChart * barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    PNBarChart * barChartB = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 355.0, SCREEN_WIDTH, 200.0)];
    
    NSArray *arrayLabel = ((MiDictionary*)[((MiDictionary*)[mainUtil.dData valueForKey:@"chart_data"]) valueForLabel:@"Week 1"]).allLabels;
    if(arrayLabel==nil||arrayLabel.count<1){arrayLabel=@[@"JAN",@"FEB",@"MAR",@"APR",@"MAY", @"JUN",@"JUL",@"AUG",@"SEP",@"OCT",@"NOV", @"DEC"];}
    [barChart setXLabels:arrayLabel];
    NSArray *data01Array = ((MiDictionary*)[((MiDictionary*)[mainUtil.dData valueForKey:@"chart_data"]) valueForLabel:@"Week 1"]).allValues;
    if(data01Array==nil||data01Array.count<1){data01Array = @[@120, @100, @90, @95, @92, @104, @98, @101, @98, @92, @85, @88, @84, @98];}
    [barChart setYValues:data01Array];
    [barChart strokeChart];
    
    NSArray *arrayLabelB = ((MiDictionary*)[((MiDictionary*)[mainUtil.dData valueForKey:@"chart_data"]) valueForLabel:@"Week 2"]).allLabels;
    if(arrayLabelB==nil||arrayLabelB.count<1){arrayLabelB=@[@"JAN",@"FEB",@"MAR",@"APR",@"MAY", @"JUN",@"JUL",@"AUG",@"SEP",@"OCT",@"NOV", @"DEC"];}
    [barChartB setXLabels:arrayLabelB];
    NSArray *data02Array = ((MiDictionary*)[((MiDictionary*)[mainUtil.dData valueForKey:@"chart_data"]) valueForLabel:@"Week 2"]).allValues;
    if(data02Array==nil||data02Array.count<1){data02Array = @[@120, @100, @90, @95, @92, @104, @98, @101, @98, @92, @85, @88, @84, @98];}
    [barChartB setYValues:data02Array];
    [barChartB strokeChart];
    
    [self.view addSubview:barChart];
    [self.view addSubview:barChartB];
}

- (void) presentCircleChart {
    PNCircleChart * circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(0, 80.0, SCREEN_WIDTH, 100.0) total:[NSNumber numberWithInt:100] current:[NSNumber numberWithInt:60] clockwise:NO shadow:NO shadowColor:UIColor.blackColor];
    circleChart.backgroundColor = [UIColor clearColor];
    [circleChart setStrokeColor:PNGreen];
    [circleChart strokeChart];
    
    [self.view addSubview:circleChart];
}

- (void) presentPieChart {
    NSArray *summed1 = @[@130, @105, @85, @92, @96, @108, @103, @98, @99, @94, @85, @82, @94, @103];
    NSArray *summed2 = @[@120, @100, @90, @95, @92, @104, @98, @101, @98, @92, @85, @88, @84, @98];
    int sum1 =0;
    for(NSString *aVal in summed1) {
        sum1 += aVal.intValue;
    }
    int sum2 =0;
    for(NSString *aVal in summed2) {
        sum2 += aVal.intValue;
    }
    
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:sum1 color:PNBlue description:@"Home Device 1"],
                               [PNPieChartDataItem dataItemWithValue:sum2 color:PNGreen description:@"Home Device 2"],
                               ];

    PNPieChart *pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(40.0, 155.0, 240.0, 240.0) items:items];
    pieChart.descriptionTextColor = [UIColor whiteColor];
    pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:14.0];
    [pieChart strokeChart];
    
    [self.view addSubview:pieChart];
}

@end
