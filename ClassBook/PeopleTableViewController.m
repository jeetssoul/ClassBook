//
//  PeopleTableViewController.m
//  ClassBook
//
//  Created by Jitender Badlani on 7/23/15.
//  Copyright (c) 2015 Jitender Badlani. All rights reserved.
//

#import "PeopleTableViewController.h"
#import "Person.h"
#import "PersonDetailViewController.h"
#import "DataManager.h"

@interface PeopleTableViewController ()

//@property (nonatomic, strong) NSArray *people;
@property (nonatomic, strong) NSArray *people;

@end

@implementation PeopleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataManager *dataManager = [DataManager sharedInstance];
    
    self.people = dataManager.fetchPeopleFromPlist; //[[DataManager alloc]initWithArray:dataManager.fetchPeopleFromPlist];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadDetailPersonalView:)
                                                 name:@"Person Selected"
                                               object:nil];
    
    //self.people = [[NSMutableArray alloc] init];
    //[self populatePeople];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }    
    Person *myPerson = [self.people objectAtIndex:indexPath.row];
    cell.textLabel.text = [myPerson.firstName stringByAppendingString:[@" " stringByAppendingString:myPerson.lastName]];
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Person *person = [self.people objectAtIndex:indexPath.row];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Person Selected" object:person];
    NSLog(@"The user selected: %@", person.firstName);
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

-(void) loadDetailPersonalView: (NSNotification *) notification
{
    //PersonDetailViewController *personDVC = [[PersonDetailViewController alloc] init];
    
    PersonDetailViewController *controllerobj = [self.storyboard instantiateViewControllerWithIdentifier:@"PersonDetail"];
    controllerobj.person = notification.object;
    [self.navigationController pushViewController:controllerobj animated:YES];
    [self presentViewController:controllerobj animated:YES completion:nil];
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue: %@", segue.identifier);
    
    if ([segue.identifier isEqualToString:@"Happy"])
    {
        [segue.destinationViewController setHappiness:100];
    }
    else if ([segue.identifier isEqualToString:@"Sad"])
    {
        [segue.destinationViewController setHappiness:0];
    }
}
*/
@end
