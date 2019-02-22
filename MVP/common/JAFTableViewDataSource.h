//
//  JAFDataSource.h
//  MVP
//
//  Created by 阿飞 on 2019/2/20.
//  Copyright © 2019年 阿飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^TableViewCellBlock) (id cell,id model,NSIndexPath *indexPath);
typedef void(^SelectCellBlock)(NSIndexPath *indexPath);

@interface JAFTableViewDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)  NSMutableArray *dataArray;

-(instancetype)initWithCellIdentifier:(NSString *)cellIdentifier tableViewCellBlock:(TableViewCellBlock)tableViewCellBlock selectCell:(SelectCellBlock)selectCellBlock;
-(void)addDataArray:(NSArray *)dataArray;

@end













