//
//  ListLoader.h
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/30.
//

#import <Foundation/Foundation.h>
@class CashItem;
NS_ASSUME_NONNULL_BEGIN
typedef void(^ListLoaderFinishBlock)(BOOL success,NSArray<CashItem *>*dataArray);
@interface ListLoader : NSObject
-(void)loadDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
