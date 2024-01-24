//
//  ViewController.m
//  GraphExample
//
//  Created by Admin on 2024/01/19.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "ChartViewController.h"
#import "MainUtil.h"
#import "MiDictionary.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtOwnJSON;

@end

@implementation ViewController

NSArray *arr;

- (void)viewDidLoad {
    arr = [[NSArray alloc] initWithObjects:@"Line", @"Bar", @"Pie", @"Circle", nil];
    [_txtOwnJSON selectAll:nil];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"http://10.0.3.152:8080/WepAppSample/webresources/com.cbm.web.webappsample.entity.userProfile"]];
    __block NSDictionary *json;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"WepAppSample \n\nResponse: %@\nData: %@", response.description, data.description);
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cella"];
    cell.textLabel.text = [[NSString alloc] initWithFormat:@"%@", [arr objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    ChartViewController *cvc =
               [storyboard instantiateViewControllerWithIdentifier:@"ChartVC"];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    MainUtil *data = [[MainUtil alloc] init];
    MiDictionary *mdict = [[MiDictionary alloc] init];
    MiDictionary *mdictW1 = [[MiDictionary alloc] init];
    [mdictW1 setValue:@0 forLabel:@"@Score 1"];
    [mdictW1 setValue:@-1 forLabel:@"@Score 2"];
    [mdictW1 setValue:@0 forLabel:@"@Score 3"];
    [mdictW1 setValue:@2 forLabel:@"@Score 4"];
    [mdictW1 setValue:@4 forLabel:@"@Score 5"];
    [mdictW1 setValue:@7 forLabel:@"@Score 6"];
    [mdictW1 setValue:@3 forLabel:@"@Score 7"];
    [mdictW1 setValue:@5 forLabel:@"@Score 8"];
    [mdict setValue:mdictW1 forLabel:@"Week 1"];
    MiDictionary *mdictW2 = [[MiDictionary alloc] init];
    [mdictW2 setValue:@2 forLabel:@"@Score 1"];
    [mdictW2 setValue:@3 forLabel:@"@Score 2"];
    [mdictW2 setValue:@5 forLabel:@"@Score 3"];
    [mdictW2 setValue:@8 forLabel:@"@Score 4"];
    [mdictW2 setValue:@4 forLabel:@"@Score 5"];
    [mdict setValue:mdictW2 forLabel:@"Week 2"];
//    [mdict setValue:@4 forLabel:@"Week 3"];
//    [mdict setValue:@4 forLabel:@"Week 4"];
//    [mdict setValue:@3 forLabel:@"Week 5"];
//    [mdict setValue:@5 forLabel:@"Week 6"];
//    [mdict setValue:@4 forLabel:@"Week 7"];
//    [mdict setValue:@6 forLabel:@"Week 8"];
//    [mdict setValue:@3 forLabel:@"Week 9"];
//    [mdict setValue:@4 forLabel:@"Week 10"];
    [data.dData setValue:cell.textLabel.text forKey:@"chart_type"];
    [data.dData setValue:mdict forKey:@"chart_data"];
    
    [self.navigationController pushViewController:cvc animated:true];
}


@end
