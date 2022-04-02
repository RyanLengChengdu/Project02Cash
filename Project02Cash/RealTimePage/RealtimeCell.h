//
//  RealtimeCell.h
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/4/2.
//

#import <UIKit/UIKit.h>
@class CashItem;
NS_ASSUME_NONNULL_BEGIN

@interface RealtimeCell : UITableViewCell
-(void)loadDataWithItem:(CashItem *)item;
@end

NS_ASSUME_NONNULL_END
