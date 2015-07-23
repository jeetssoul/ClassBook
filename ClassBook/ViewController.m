//
//  ViewController.m
//  ClassBook
//
//  Created by Jitender Badlani on 7/23/15.
//  Copyright (c) 2015 Jitender Badlani. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "PeopleTableViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@property (nonatomic,strong) PeopleTableViewController *peopleTableViewController;

//@property (strong, nonatomic) BlueViewController *blueViewController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Button Press

-(IBAction)authenticationButtonTapped:(id)sender
{
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    
    if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
    {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Are you the device owner ?"
                          reply:^(BOOL success, NSError *error) {
                              if (error) {
                                  [SVProgressHUD showErrorWithStatus:@"There was a problem"];
                                  return;
                              }
                              if (success) {
                                  [SVProgressHUD showErrorWithStatus:@"You are the owner"];
                                  return;
                              }
                              else
                              {
                                  [SVProgressHUD showErrorWithStatus:@"You are not the device owner"];
                                  return;
                              }
                              
                          }];
    }
    else
    {
        /*ifUIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Your device cannot authenticate using TouchID"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];*/
        //[SVProgressHUD showErrorWithStatus:@"Your device cannot authenticate using TouchID"];
        //UITableViewController *tableVC = [self.storyboard instantiateViewControllerWithIdentifier:@"People"];
        self.peopleTableViewController.view.frame = self.view.frame;
        //[self switchViewFromViewControlle toViewController:self.yellowViewController];
        
        
    }
}
@end
