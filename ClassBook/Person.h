//
//  Person.h
//  ClassBook
//
//  Created by Jitender Badlani on 7/23/15.
//  Copyright (c) 2015 Jitender Badlani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject


@property(nonatomic,retain) NSString *firstName;
@property(nonatomic,retain) NSString *lastName;
@property(nonatomic,retain) NSString *address;
@property(nonatomic,retain) NSString *city;
@property(nonatomic,retain) NSString *state;
@property(nonatomic,retain) NSString *zip;
@property(nonatomic,retain) NSString *mobile;

@end
