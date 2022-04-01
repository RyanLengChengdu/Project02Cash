//
//  CheckListCell.h
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/30.
//

#import <UIKit/UIKit.h>
@class CashItem;
NS_ASSUME_NONNULL_BEGIN

@interface CheckListCell : UITableViewCell
-(void)setDataWithCashItem:(CashItem *)item;
@end

NS_ASSUME_NONNULL_END
