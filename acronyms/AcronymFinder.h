//
//  AcronymFinder.h
//  acronyms
//
//  Created by Test on 30/08/15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcronymFinder : NSObject
+ (void)getAcronymFor:(NSString *)string
              success:(void (^)(id responseObject))success
              failure:(void (^)(NSError *error))failure;
@end
