//
//  Store.h
//  Assignment1
//
//  Created by user248619 on 9/28/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Store : NSObject

@property(nonatomic) NSMutableArray *itemList;
@property(nonatomic) NSMutableArray *historyItems;


- (double)purchaseatIndex:(NSInteger)index forQuantity:(int)qty;

-(id)ItemInfo:(NSInteger)row;
-(NSInteger)numOfItems;
-(double)getPrice:(NSInteger)row;
-(int)getQuantity:(NSInteger)row;
-(id)getItemName:(NSInteger)row;
-(NSInteger)numOfHistoryItems;
-(int)updateQty: (NSInteger) index forAmount:(int) amount;
-(id)HistoryList:(NSInteger)row;

@end



NS_ASSUME_NONNULL_END
