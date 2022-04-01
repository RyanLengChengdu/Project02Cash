//
//  transferItem.h
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/4/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface transferItem : NSObject
@property(nonatomic,copy,readwrite)NSString *sourceCash;
@property(nonatomic,copy,readwrite)NSString *fBuyPri;
@property(nonatomic,copy,readwrite)NSString *mBuyPri;
@end

NS_ASSUME_NONNULL_END
