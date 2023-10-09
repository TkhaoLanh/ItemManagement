//
//  HistoryTableViewController.m
//  Assignment1
//
//  Created by user248619 on 9/29/23.
//

#import "HistoryTableViewController.h"
#import "DetailedViewController.h"

@interface HistoryTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myHistory;
@property(nonatomic)int selectedRow;

@end

@implementation HistoryTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Register the cell identifier programmatically
    [self.myHistory registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.myHistory reloadData];
}


-(Store*)myList{
    if(_myList ==nil){
        _myList = [[Store alloc]init];
    }
    return _myList;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.myList numOfHistoryItems];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
     
    NSDictionary *purchaseRecord = [self.myList.historyItems objectAtIndex:indexPath.row];
        
    // Configure the title label
    myCell.textLabel.text = [NSString stringWithFormat:@"%@  %d",purchaseRecord[@"title"],[purchaseRecord[@"quantity"] intValue]];
    
        return myCell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Get the selected row index
        self.selectedRow = (int)indexPath.row;

        // Perform any actions you want when a row is selected
        NSLog(@"Selected Row: %d", self.selectedRow);

        // If you want to perform a segue when a row is selected, you can do it here
        [self performSegueWithIdentifier:@"Detail" sender:self];}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Detail"]) {
        DetailedViewController *dvc = (DetailedViewController *)segue.destinationViewController;
        NSDictionary *selectedTransaction = [self.myList.historyItems objectAtIndex:self.selectedRow];
        dvc.transactionData = selectedTransaction;
      
    }
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


@end
