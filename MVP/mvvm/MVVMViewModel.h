//
//  MVVMViewModel.h
//  003--MVP
//
//  Created by chriseleee on 2018/8/29.
//  Copyright © 2018年 Cooci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@interface MVVMViewModel : BaseViewModel

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, copy) NSString *contentKey;

-(void)loadData;


@end
