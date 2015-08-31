//
//  AcronymFinder.m
//  acronyms
//
//  Created by Test on 30/08/15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "AcronymFinder.h"
#import "AFHTTPRequestOperationManager.h"

@implementation AcronymFinder

+ (void)getAcronymFor:(NSString *)string
                                 success:(void (^)(id responseObject))success
                                 failure:(void (^)(NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager setRequestSerializer:[AFHTTPRequestSerializer serializer]];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:[[NSString stringWithFormat:@"http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=%@",string] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
             if(array.count>0)
                 success([[array objectAtIndex:0] objectForKey:@"lfs"]);
             else
                 success(@[]);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             failure(error);
         }];
}
@end
