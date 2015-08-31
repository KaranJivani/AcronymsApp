//
//  ViewController.h
//  acronyms
//
//  Created by Test on 30/08/15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate>
{
    IBOutlet UITableView *acronymTableView;
}
@property (nonatomic,strong)NSArray *arrayAcronymResults;
@end

