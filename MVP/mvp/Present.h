//
//  Present.h
//  MVP
//
//  Created by 阿飞 on 2019/2/21.
//  Copyright © 2019年 阿飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PresentProtocolDelegate.h"

@interface Present : NSObject<PresentProtocolDelegate>//遵循代理协议

@property (nonatomic, strong) NSMutableArray *dataArray;
// 根据需求
- (void)loadData;

@property (nonatomic, weak) id<PresentProtocolDelegate>delegate;//协议变量
@end
