//
//  ManagerViewController.m
//  Assignment1
//
//  Created by user248619 on 9/29/23.
//

#import "ManagerViewController.h"
#import "HistoryTableViewTableViewController.h"
#import "ResetViewController.h"

@interface ManagerViewController ()

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"History"]){
        HistoryTableViewTableViewController *htvc = (HistoryTableViewTableViewController*) segue.destinationViewController;
        htvc.myList = self.myList;
    }else if([segue.identifier isEqualToString:@"Reset"]){
        ResetViewController *rsvc = (ResetViewController*) segue.destinationViewController;
        rsvc.myList = self.myList;
    }else{
        NSLog(@"Incorrect segue!");
    }
}

@end

