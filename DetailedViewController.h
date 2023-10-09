//
//  DetailedViewController.h
//  Assignment1
//
//  Created by user248619 on 9/30/23.
//

#import <UIKit/UIKit.h>
#import "Store.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailedViewController : UIViewController
@property(nonatomic) Store *myList;
@property (nonatomic, strong) NSDictionary *transactionData;

@end

NS_ASSUME_NONNULL_END
