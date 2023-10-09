//
//  HistoryOfPurchases.m
//  Assignment1
//
//  Created by user248619 on 9/28/23.
//

#import "HistoryOfPurchases.h"

@implementation HistoryOfPurchases

- (instancetype)initWithTitle:(NSString *)title andPrice:(double)price andQuantity:(int)quantity andDate:(NSDate*) date
{
    self = [super init];
    if (self) {
        self.title = title;
        self.price = price;
        self.quantity = quantity;
        self.date = date;
    }
    return self;
}

@end
