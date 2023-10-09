//
//  DetailedViewController.m
//  Assignment1
//
//  Created by user248619 on 9/30/23.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()
@property (weak, nonatomic) IBOutlet UILabel *myItem;
@property (weak, nonatomic) IBOutlet UILabel *myQty;
@property (weak, nonatomic) IBOutlet UILabel *myDate;

@property (weak, nonatomic) IBOutlet UILabel *myAmt;
@end

@implementation DetailedViewController

@synthesize transactionData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Set the labels to display transaction details
        self.myItem.text = self.transactionData[@"title"];
        self.myQty.text = [NSString stringWithFormat:@"%d", [self.transactionData[@"quantity"] intValue]];
        
        // Format and display the date
        NSDate *purchaseDate = self.transactionData[@"date"];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMM dd, yyyy HH:mm:ss"];
        self.myDate.text = [dateFormatter stringFromDate:purchaseDate];
        
        // Calculate the total amount and display it
        double price = [self.transactionData[@"price"] doubleValue];
        int quantity = [self.transactionData[@"quantity"] intValue];
        double totalAmount = price * quantity;
        self.myAmt.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
}

-(Store*)myList{
    if(_myList ==nil){
        _myList = [[Store alloc]init];
        
        //[self.myList purchaseatIndex:index forQuantity:qty];
    }
    return _myList;
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
