//
//  CashItem.h
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CashItem : NSObject
@property(nonatomic,copy,readwrite)NSString *name;
@property(nonatomic,copy,readwrite)NSString *fBuyPri;
@property(nonatomic,copy,readwrite)NSString *mBuyPri;
@property(nonatomic,copy,readwrite)NSString *fSellPri;
@property(nonatomic,copy,readwrite)NSString *mSellPri;
@property(nonatomic,copy,readwrite)NSString *bankConversionPri;
@property(nonatomic,copy,readwrite)NSString *date;
@property(nonatomic,copy,readwrite)NSString *time;
@end

NS_ASSUME_NONNULL_END
