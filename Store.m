//
//  Store.m
//  Assignment1
//
//  Created by user248619 on 9/28/23.
//

#import "Store.h"
#import "Item.h"
#import "HistoryOfPurchases.h"

@implementation Store

//lazy loading

-(NSMutableArray*) itemList{
    if(_itemList ==nil){
        _itemList = [[NSMutableArray alloc]initWithObjects:
                     [[Item alloc]initWithTitle:@"Shorts" andPrice:10.5 andQuantity:(int)15],
                     [[Item alloc]initWithTitle:@"Pants" andPrice:20.5 andQuantity:25],
                     [[Item alloc]initWithTitle:@"Dress" andPrice:50.35 andQuantity:30],nil];
    }
    return  _itemList;
}

- (NSMutableArray *)historyItems{
    if(_historyItems ==nil){
        _historyItems = [[NSMutableArray alloc]init];
    }
    
    return _historyItems;
}

-(id)getItemName:(NSInteger)row{
    Item *item = [self.itemList objectAtIndex:row];
    return item.title;
}

-(int)getQuantity:(NSInteger)row{
    Item *item = [self.itemList objectAtIndex:row];
    return item.quantity;
}

-(double)getPrice:(NSInteger)row{
    Item *item = [self.itemList objectAtIndex:row];
    return item.price;
}

-(NSInteger)numOfItems{
    return self.itemList.count;
}

-(NSInteger)numOfHistoryItems{
        return self.historyItems.count;
}

-(int)updateQty: (NSInteger) index forAmount:(int) amount{
    Item *item = [self.itemList objectAtIndex:index];
    item.quantity +=amount;
    return item.quantity;
}

-(id)HistoryList:(NSInteger)row{
    HistoryOfPurchases *history = [self.historyItems objectAtIndex:row];
    NSLog(@"History: %@ %d",history.title,history.quantity);
    return [NSString stringWithFormat:@"%@ %d", history.title,history.quantity];
}

-(id)ItemInfo:(NSInteger)row{
    Item *item = [self.itemList objectAtIndex:row];
    return [NSString stringWithFormat:@"%@ - %d - %.2f", item.title,item.quantity,item.price];
}


-(double)purchaseatIndex: (NSInteger) index forQuantity:(int) qty{
    Item *item = [self.itemList objectAtIndex:index];
    if(item.quantity >= qty){
        double total = qty * item.price;
        item.quantity = item.quantity - qty;
        
        
        NSDictionary *purchaseRecord = @{
                    @"title": item.title,
                    @"price": @(item.price),
                    @"quantity": @(qty),
                    @"date": [NSDate date]
                };
                [self.historyItems addObject:purchaseRecord];
        
        NSLog(@"Add %@",self.historyItems);
        return total;
    }else{
        return -1;
    }
}

@end
