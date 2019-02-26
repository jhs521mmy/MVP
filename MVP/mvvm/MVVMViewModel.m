//
//  MVVMViewModel.m
//  003--MVP
//
//  Created by chriseleee on 2018/8/29.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import "MVVMViewModel.h"
#import "Model.h"
#import <YYKit.h>
@implementation MVVMViewModel

#pragma mark - lazy

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:1];
    }
    return _dataArray;
}


- (instancetype)init{
    if (self==[super init]) {
        [self loadData];
        [self addObserver:self forKeyPath:@"contentKey" options:(NSKeyValueObservingOptionNew) context:nil];
    }
    return self;
}
#pragma mark --- KVO

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    
    NSLog(@"%@",change[NSKeyValueChangeNewKey]);
    NSArray *temArray = @[@"火车",@"飞机",@"跑车",@"女票",@"男票",@"滑板",@"一日游"];
    NSMutableArray *aArray = [NSMutableArray arrayWithArray:temArray];
    @synchronized(self){
        
         [aArray removeObject:change[NSKeyValueChangeNewKey]];
//        for (int i = 0; i<aArray.count; i++) {
//            Model *m = [Model modelWithDictionary:temArray[i]];
//            [self.dataArray addObject:m];
//        }
    }
    if (self.successBlock) {
        
        self.successBlock(aArray);
        
    }
    
}

#pragma mark --- 析构
-(void)dealloc{
    
    [self removeObserver:self forKeyPath:@"contentKey"];
    
}

-(void)loadData{
    
    dispatch_queue_t q = dispatch_queue_create("udpios", DISPATCH_QUEUE_CONCURRENT);
    
    //2.异步执行任务
    dispatch_async(q, ^{
        
        NSArray *temArray = @[@"火车",@"飞机",@"跑车",@"女票",@"男票",@"滑板",@"一日游"];
        [self.dataArray removeAllObjects];
//        for (int i = 0; i<temArray.count; i++) {
//            Model *m = [Model modelWithDictionary:temArray[i]];
//            [self.dataArray addObject:m];
//        }
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.successBlock) {
                // main更新代码
                self.successBlock(temArray);
            }
        });
        
        
    });
    
}

@end
