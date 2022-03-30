//
//  ListLoader.m
//  Project02Cash
//
//  Created by 冷锐鹏 on 2022/3/30.
//

#import "ListLoader.h"
#import "CashItem.h"
#import "AFNetworking.h"
#import "YYModel.h"
@implementation ListLoader
-(void)loadDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *url = @"http://web.juhe.cn/finance/exchange/rmbquot";
    NSDictionary *dic = @{@"key":@"b50df16ad6df1951e49f1f937e98fe01"};
//    AFHTTPResponseSerializer *serializer1 = [AFHTTPResponseSerializer serializer];
//    serializer1.acceptableContentTypes = [NSSet setWithObjects: @"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager GET:url parameters:dic headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"%@",responseObject);
        NSArray *dataArray = ([((NSDictionary *)responseObject) objectForKey:@"result"][0]);
        NSLog(@"%@",dataArray);
        NSMutableArray *ItemListArray = @[].mutableCopy;
        for (NSDictionary*info in dataArray) {
            CashItem *item = [CashItem yy_modelWithDictionary:info];
            [ItemListArray addObject:item];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (finishBlock) {
                finishBlock(YES,ItemListArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end
