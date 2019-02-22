//
//  Present.m
//  MVP
//
//  Created by 阿飞 on 2019/2/21.
//  Copyright © 2019年 阿飞. All rights reserved.
//

#import "Present.h"
#import "Model.h"
#import <YYKit.h>
@implementation Present

-(instancetype)init{
    
    self = [super init];
    if (self) {
        
        [self loadData];
        
    }
    return self;
    
}
- (void)loadData{
    
    NSArray *temArray =
    @[
      @{@"name":@"小明",@"imageUrl":@"http://CC",@"num":@"9"},
      @{@"name":@"小飞",@"imageUrl":@"http://James",@"num":@"9"}];
    for (int i = 0; i<temArray.count; i++) {
        Model *m = [Model modelWithDictionary:temArray[i]];
        [self.dataArray addObject:m];
    }
 
}
#pragma mark --- PresentProtocolDelegate
-(void)didClickWithNum:(NSString *)num indexPathRow:(NSIndexPath *)indexPath{
    
    if (indexPath.row<self.dataArray.count) {
        @synchronized(self){
            Model *model = self.dataArray[indexPath.row];
            model.num =  num;
        }
    }
  
    if ([num intValue]>5) {
        NSArray *temArray =
        @[
          @{@"name":@"小明",@"imageUrl":@"http://CC",@"num":@"9"},
          @{@"name":@"小飞",@"imageUrl":@"http://James",@"num":@"9"},
          @{@"name":@"哈哈",@"imageUrl":@"http://Gavin",@"num":@"9"},
          @{@"name":@"林飞",@"imageUrl":@"http://Cooci",@"num":@"9"},@{@"name":@"林飞",@"imageUrl":@"http://Cooci",@"num":@"9"},@{@"name":@"林飞",@"imageUrl":@"http://Cooci",@"num":@"9"}];
        
        [self.dataArray removeAllObjects];
        
        for (int i = 0; i<temArray.count; i++) {
            Model *m = [Model modelWithDictionary:temArray[i]];
            [self.dataArray addObject:m];
        }
        
        if (self.delegate&&[self.delegate respondsToSelector:@selector(reloadUI)]) {
            [self.delegate reloadUI];
        }
    }
    
    
}
#pragma mark - lazy

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}

@end
