//
//  MRKViewController.m
//  pickerViewTests-iOS7
//
//  Created by Mark Norgren on 10/29/13.
//  Copyright (c) 2013 Mark Norgren. All rights reserved.
//

#import "MRKViewController.h"

@interface MRKViewController ()

@property (nonatomic, strong) NSArray *pickerItems;
@property (nonatomic, strong) NSArray *tableItems;

@end

@implementation MRKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.pickerItems = @[@"one", @"two", @"three", @"four", @"five"];
    NSMutableArray *tmpTableItems = [NSMutableArray arrayWithArray:@[]];
    for (int i = 0; i<20; i++) {
        tmpTableItems[i] = [NSString stringWithFormat:@"%d", i];
    }
    self.tableItems = [NSArray arrayWithArray:tmpTableItems];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.tableItems count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.tableItems[indexPath.row];
    
    return cell;
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"table - row%d", indexPath.row);
}



#pragma mark -
#pragma Picker View Data Source methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //Return the number of components
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //Return the number of rows in the component
    return [self.pickerItems count];
}

#pragma mark -
#pragma Picker View Delegate methods


// - (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
// {
//     return 320.f;
// }



// Return a string representing the title for the given row.
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [self.pickerItems objectAtIndex:row];

}



- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"picker - row%d", row);
}

@end
