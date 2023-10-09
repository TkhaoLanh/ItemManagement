//
//  ViewController.m
//  Assignment1
//
//  Created by user248619 on 9/28/23.
//

#import "ViewController.h"
#import "Store.h"
#import "Item.h"
#import "ManagerViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property(nonatomic)Store *myList;
@property (weak, nonatomic) IBOutlet UILabel *myTotal;
@property (weak, nonatomic) IBOutlet UILabel *myQuantity;
@property (weak, nonatomic) IBOutlet UILabel *myItem;
@property(nonatomic)int selectedRow;
@property (weak, nonatomic) IBOutlet UILabel *myMessage;
@property bool isNewNumber;

@end

@implementation ViewController

//lazy loading

-(Store*)myList{
    if(_myList ==nil){
        _myList = [[Store alloc]init];
    }
    return _myList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNewNumber = YES;
    
}
-(void)viewDidAppear:(BOOL)animated{
    self.myItem.text = @"";
    self.myQuantity.text = @"";
    self.myTotal.text = @"";
    self.myMessage.text = @"";
    [self.pickerView reloadAllComponents];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.myList numOfItems];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [self.myList ItemInfo:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.myItem.text = @"";
    self.myQuantity.text = @"";
    self.myTotal.text = @"";
    self.myMessage.text = @"";
    
    self.myItem.text = [self.myList getItemName:row];
    self.selectedRow = (int)row;
    
}
- (IBAction)Digit_Pressed:(UIButton *)sender {
    //check is newnumber
    if(self.isNewNumber){
        //if this is a new number, get number from button
        self.myQuantity.text = sender.titleLabel.text;
        //set this is not a new number
        self.isNewNumber = NO;
    }else{//if not
        //get current number on myDisplay
        NSString *currentDisplay = self.myQuantity.text;
        //get a new number from button
        NSString *newDigit = sender.titleLabel.text;
        //concatinate numbers into a new number
        self.myQuantity.text = [NSString stringWithFormat:@"%@%@",currentDisplay,newDigit];
    }
    
}
- (IBAction)Buy_Pressed:(UIButton *)sender {
    NSString *quantityString = self.myQuantity.text;
    // Check if user doesn't enter quantity
    if (quantityString.length == 0)
    {
        self.myMessage.text =@"Please enter a valid quantity!";
        return;
    }
    
    //get quantity from user button
    int quantityToBuy = self.myQuantity.text.doubleValue;
    
    //get quantity from Store
    int quantityInStock = [self.myList getQuantity:self.selectedRow];
    
    if(quantityToBuy > quantityInStock){
        self.myMessage.text =@"Not enough quantity in stock!";
        self.myQuantity.text=@"";
        return;
    }
    //calculate total
    double total = [self.myList purchaseatIndex:self.selectedRow forQuantity:quantityToBuy];
    //display on textfield
    self.myTotal.text = [NSString stringWithFormat:@"%.2f", total];
    
    //show message
    self.myMessage.text =@"Purchase sucessfully. Thank you!";
    
    //reload pickerView after purchase
    [self.pickerView reloadAllComponents];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Manager"]){
        ManagerViewController *mvc = (ManagerViewController*)segue.destinationViewController;
        mvc.myList = self.myList;
    }
}



@end
