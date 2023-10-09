//
//  Item.h
//  Assignment1
//
//  Created by user248619 on 9/28/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject

@property(nonatomic) NSString *title;
@property(nonatomic) double price;
@property(nonatomic) int quantity;

- (instancetype)initWithTitle:(NSString*) title andPrice:(double) price andQuantity:(int)quantity;
@end

NS_ASSUME_NONNULL_END
