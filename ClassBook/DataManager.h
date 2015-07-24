//
//  DataManager.h
//  ClassBook
//
//  Created by Jitender Badlani on 7/24/15.
//  Copyright (c) 2015 Jitender Badlani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (DataManager *)sharedInstance;
- (NSArray *)fetchPeopleFromPlist;
- (NSString *)dataFilePath;
- (void)createPList;
//-(NSArray *)buildPList;

@end
