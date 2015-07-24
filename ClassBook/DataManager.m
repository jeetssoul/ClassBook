//
//  DataManager.m
//  ClassBook
//
//  Created by Jitender Badlani on 7/24/15.
//  Copyright (c) 2015 Jitender Badlani. All rights reserved.
//

#import "DataManager.h"
#import "Person.h"

#define kFileName @"/people.plist"

@interface DataManager ()

@property (nonatomic, retain) NSArray *array;
@property (nonatomic, retain) NSMutableArray *peopleArray;
@end

@implementation DataManager

static DataManager *SINGLETON = nil;
//static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (DataManager *)sharedInstance
{
    static DataManager *_sharedClient = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        //isFirstAccess = NO;
        _sharedClient = [[DataManager alloc] init];
    });
    
    return _sharedClient;
}
-(NSArray *) fetchPeopleFromPlist
{
    self.array = [[NSArray alloc] init];
    [self checkForPlist];
    return self.peopleArray;
    
}
-(void)checkForPlist
{
    NSString *filePath = [self dataFilePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        [self buildPList];
    } else {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(buildPList)
                                                     name:@"Build Plist"
                                                   object:nil];
        [self createPList];
    }
    //return array;
}

-(void)buildPList
{
    NSString *filePath = [self dataFilePath];
    NSArray *array = [[NSArray alloc] init];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath])
    {
        array = [[NSArray alloc] initWithContentsOfFile:filePath];
    }
    self.array = array;
    [self buildArrayOfPeople];
    
    
}

-(NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingString:kFileName];
}

- (void)createPList
{
/*
    Person *myPerson = Person.new; //[[Person alloc] init];
    myPerson.firstName = @"Jitender";
    myPerson.lastName = @"Badlani";
    myPerson.address = @"2121 Avenue Of the Stars";
    myPerson.city = @"Los Angeles";
    myPerson.state = @"CA";
    myPerson.zip = @"90067";
    myPerson.mobile = @"6517348640";
    
    //myPerson = nil;
    
    Person *myPerson2 = Person.new;
    myPerson2.firstName = @"Ralph";
    myPerson2.lastName = @"G";
    myPerson2.address = @"2121 Avenue Of the Stars";
    myPerson2.city = @"Los Angeles";
    myPerson2.state = @"CA";
    myPerson2.zip = @"90067";
    myPerson2.mobile = @"3103694132";

    
    Person *myPerson3 = Person.new;
    myPerson3.firstName = @"Whil";
    myPerson3.lastName = @"Reliford";
    myPerson3.address = @"2121 Avenue Of the Stars";
    myPerson3.city = @"Los Angeles";
    myPerson3.state = @"CA";
    myPerson3.zip = @"90067";
    myPerson3.mobile = @"3103694132";
    
    NSArray *array = [[NSArray alloc] initWithObjects:myPerson,myPerson2,myPerson3, nil];*/
    
   NSArray *array = [[NSMutableArray alloc] initWithArray:@[@{@"firsName": @"Jitender",
                                                               @"lastName": @"Badlani",
                                                               @"address": @"2121 Avenue Of the Stars",
                                                               @"city": @"Los Angeles",
                                                               @"state": @"CA",
                                                               @"zip": @"90067",
                                                               @"mobile" : @"6517348640"},
                                                             @{@"firsName": @"Ralph",
                                                               @"lastName": @"G",
                                                               @"address": @"2121 Avenue Of the Stars",
                                                               @"city": @"Los Angeles",
                                                               @"state": @"CA",
                                                               @"zip": @"90067",
                                                               @"mobile" : @"3103694132"},
                                                             @{@"firsName": @"Whil",
                                                               @"lastName": @"Reliford",
                                                               @"address": @"2121 Avenue Of the Stars",
                                                               @"city": @"Los Angeles",
                                                               @"state": @"CA",
                                                               @"zip": @"90067",
                                                               @"mobile" : @"3103695467"}]];
   
    [array writeToFile:[self dataFilePath] atomically:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Build Plist" object:nil];
}


-(void)buildArrayOfPeople
{
    self.peopleArray = [[NSMutableArray alloc]init];
    for(NSDictionary *dict in self.array)
    {
        Person *person = [Person new];
        person.firstName = [dict valueForKey:@"firsName"];
        person.lastName = [dict valueForKey:@"lastName"];
        person.address = [dict valueForKey:@"address"];
        person.city = [dict valueForKey:@"city"];
        person.state = [dict valueForKey:@"state"];
        person.zip = [dict valueForKey:@"zip"];
        person.mobile = [dict valueForKey:@"mobile"];
        
        
        [self.peopleArray addObject:person];
    }
    
    
}

#pragma mark - Life Cycle
/*
+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[DataManager alloc] init];
}

- (id)mutableCopy
{
    return [[DataManager alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}
*/

@end
