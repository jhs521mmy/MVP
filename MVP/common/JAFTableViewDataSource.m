//
//  JAFDataSource.m
//  MVP
//
//  Created by 阿飞 on 2019/2/20.
//  Copyright © 2019年 阿飞. All rights reserved.
//

#import "JAFTableViewDataSource.h"
@interface JAFTableViewDataSource()

@property (nonatomic,copy) NSString *cellIdentifier;
@property (nonatomic,copy) TableViewCellBlock tableViewCellBlock;
@property (nonatomic,copy) SelectCellBlock selectCellBlock;


@end
@implementation JAFTableViewDataSource

-(instancetype)initWithCellIdentifier:(NSString *)cellIdentifier tableViewCellBlock:(TableViewCellBlock)tableViewCellBlock selectCell:(SelectCellBlock)selectCellBlock
{
    self = [super init];
    if (self) {
        self.cellIdentifier = cellIdentifier;
        self.tableViewCellBlock = tableViewCellBlock;
        self.selectCellBlock = selectCellBlock;
    }
    return self;
}
-(void)addDataArray:(NSArray *)dataArray{
    
    if(!dataArray) return;
    
    if (self.dataArray.count>0) {
        [self.dataArray removeAllObjects];
    }
    
    [self.dataArray addObjectsFromArray:dataArray];
    
}
///根据cell的索引值，将传入的数据分离
- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataArray[(NSUInteger) indexPath.row];
}
#pragma mark -- TableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return !self.dataArray  ? 0: self.dataArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id model = [self itemAtIndexPath:indexPath];
    if(self.tableViewCellBlock) {
        self.tableViewCellBlock(cell,model,indexPath);
    }
    return cell;
    
}

- (NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        self.dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
    
}

@end
