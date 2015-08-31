//
//  ViewController.m
//  acronyms
//
//  Created by Test on 30/08/15.
//  Copyright (c) 2015 Test. All rights reserved.
//


#import "ViewController.h"
#import "AcronymFinder.h"
#import "MBProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize arrayAcronymResults;

- (void)viewDidLoad {
    [super viewDidLoad];
    }


#pragma mark - tableview methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayAcronymResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[arrayAcronymResults objectAtIndex:indexPath.row] objectForKey:@"lf"];
    return cell;
}

#pragma mark - searchbar method

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [AcronymFinder getAcronymFor:searchBar.text success:^(NSArray *responseObject) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            self.arrayAcronymResults = responseObject;
            [acronymTableView reloadData];
            if(responseObject.count==0)
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"No Result Found." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
        });
        
    } failure:^(NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        });
        
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
