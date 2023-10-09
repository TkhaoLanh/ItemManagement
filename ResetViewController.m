//
//  ResetViewController.m
//  Assignment1
//
//  Created by user248619 on 9/29/23.
//

#import "ResetViewController.h"

@interface ResetViewController ()<UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *myResetLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property(nonatomic)int selectedRow;
@property (weak, nonatomic) IBOutlet UIButton *CancelBTN;
@property (weak, nonatomic) IBOutlet UIButton *OkBtn;
@property (weak, nonatomic) IBOutlet UILabel *resetMessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *MainBtn;


@end

@implementation ResetViewController
//lazy loading

-(Store*)myList{
    if(_myList ==nil){
        _myList = [[Store alloc]init];
    }
    return _myList;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myResetLabel.delegate = self;
 
}
- (void)viewDidAppear:(BOOL)animated{
    [self.pickerView reloadAllComponents];
    
    UILabel *resetMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 40)]; // Adjust the frame as needed
    resetMessageLabel.text = @"Quantity reset successfully!";
    resetMessageLabel.hidden = YES; // Initially hide the message
    [self.view addSubview:resetMessageLabel];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    // Create a character set containing only numeric characters
    NSCharacterSet *numericCharacterSet = [NSCharacterSet decimalDigitCharacterSet];
    
    // Check if the replacement string contains only numeric characters
    NSCharacterSet *stringCharacterSet = [NSCharacterSet characterSetWithCharactersInString:string];
    
    if (![numericCharacterSet isSupersetOfSet:stringCharacterSet]) {
        // If the replacement string contains non-numeric characters, disallow the change
        return NO;
    }
    
    // Allow the change if it consists of numeric characters
    
    return YES;
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
    [self.myList getItemName:row];
    self.selectedRow = (int)row;
    
    // Hide the reset message when a new item is selected
        self.resetMessageLabel.hidden = YES;
}

- (void)showErrorMessage:(NSString *)errorMessage {
    // Display the error message in a UILabel or UITextView
    self.resetMessageLabel.text = errorMessage;
    self.resetMessageLabel.hidden = NO; // Make the error message visible
}

- (void)hideErrorMessage {
    // Hide the error message
    self.resetMessageLabel.hidden = YES;
}

- (IBAction)MainBtn:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)Reset_Pressed:(UIButton *)sender {
    NSString *enteredQtyString = self.myResetLabel.text;
       
       if ([enteredQtyString isEqualToString:@""]) {
           // Show an error message for an empty UITextField
           [self showErrorMessage:@"Please enter a valid quantity."];
           return;
       }
    
    int enteredQty = self.myResetLabel.text.intValue;
    
    if (self.selectedRow == -1) {
            // Show an error message for UIPickerView not being selected
            [self showErrorMessage:@"Please select an item in the UIPickerView."];
            return;
        }

    [self.myList updateQty:self.selectedRow forAmount:enteredQty];
    
    [self.pickerView reloadAllComponents];
    
    self.myResetLabel.text = @"";
    // Hide the error message, if displayed
        [self hideErrorMessage];
    
        // Show the reset message
        self.resetMessageLabel.text = @"Quantity reset successfully!";
        self.resetMessageLabel.hidden = NO;

}
- (IBAction)Cancel_Pressed:(UIButton *)sender {
    [self hideErrorMessage];
    self.resetMessageLabel.hidden = YES;
    self.myResetLabel.text = @"";
}

@end
