//
//  PersonDetailViewController.m
//  ClassBook
//
//  Created by Jitender Badlani on 7/23/15.
//  Copyright (c) 2015 Jitender Badlani. All rights reserved.
//

#import "PersonDetailViewController.h"

@interface PersonDetailViewController ()


@property(nonatomic, strong) IBOutlet UILabel *firstNameLabel;
@property(nonatomic, strong) IBOutlet UILabel *lastNameLabel;
@property(nonatomic, strong) IBOutlet UILabel *address;
@property(nonatomic, strong) IBOutlet UILabel *city;
@property(nonatomic, strong) IBOutlet UILabel *state;
@property(nonatomic, strong) IBOutlet UILabel *zip;
@property(nonatomic, strong) IBOutlet UILabel *mobile;

@end

@implementation PersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.firstNameLabel.text = self.person.firstName;
    self.lastNameLabel.text = self.person.lastName;
    self.address.text = self.person.address;
    self.city.text = self.person.city;
    self.state.text = self.person.state;
    self.zip.text = self.person.zip;
    self.mobile.text = self.person.mobile;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
