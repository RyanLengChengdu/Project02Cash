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
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    NSString *url = @"http://web.juhe.cn/finance/exchange/rmbquot";
//    NSDictionary *dic = @{@"key":@"b50df16ad6df1951e49f1f937e98fe01"};
//
//    [manager GET:url parameters:dic headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:config];
    NSURL *url = [NSURL URLWithString:@"http://web.juhe.cn/finance/exchange/rmbquot?key=b50df16ad6df1951e49f1f937e98fe01"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *datatask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"%@",error);
        NSMutableArray *dataArray =@[].mutableCopy;
                for (int i = 1; i<23; i++) {
                    [dataArray addObject:[((NSDictionary *)([((NSDictionary *)responseObject) objectForKey:@"result"][0])) objectForKey:[NSString stringWithFormat:@"data%d",i]]];
                }
                //NSLog(@"%@",dataArray);
                NSMutableArray *ItemListArray = @[].mutableCopy;
                for (NSDictionary *info in dataArray) {
                    CashItem *item = [[CashItem alloc]init];
                    item = [CashItem yy_modelWithDictionary:info];
                    [ItemListArray addObject:item];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (finishBlock) {
                        finishBlock(YES,ItemListArray.copy);
                    }
                });
    }];
    [datatask resume];
//    [manager GET:url parameters:dic headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//    }
//         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        //NSLog(@"%@",responseObject);
//
//        NSMutableArray *dataArray =@[].mutableCopy;
//        for (int i = 1; i<23; i++) {
//            [dataArray addObject:[((NSDictionary *)([((NSDictionary *)responseObject) objectForKey:@"result"][0])) objectForKey:[NSString stringWithFormat:@"data%d",i]]];
//        }
//        //NSLog(@"%@",dataArray);
//        NSMutableArray *ItemListArray = @[].mutableCopy;
//        for (NSDictionary *info in dataArray) {
//            CashItem *item = [[CashItem alloc]init];
//            item = [CashItem yy_modelWithDictionary:info];
//            [ItemListArray addObject:item];
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (finishBlock) {
//                finishBlock(YES,ItemListArray.copy);
//            }
//        });
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];
}
@end
