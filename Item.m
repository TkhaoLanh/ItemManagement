//
//  Item.m
//  Assignment1
//
//  Created by user248619 on 9/28/23.
//

#import "Item.h"

@implementation Item

//lazy loading

- (instancetype)initWithTitle:(NSString*) title andPrice:(double) price andQuantity:(int)quantity
{
    self = [super init];
    if (self) {
        self.title = title;
        self.price = price;
        self.quantity = quantity;
    }
    return self;
}

@end
