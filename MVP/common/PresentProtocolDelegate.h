//
//  PresentProtocolDelegate.h
//  MVP
//
//  Created by 阿飞 on 2019/2/22.
//  Copyright © 2019年 阿飞. All rights reserved.
//

#import <Foundation/Foundation.h>
//创建协议
@protocol PresentProtocolDelegate <NSObject>

@optional//可选实现的方法
//UI改变传值到model数据改变  UI --- > Model
-(void)didClickWithNum:(NSString *)num indexPathRow:(NSIndexPath *)indexPath;//协议需要实现的方法
//model数据改变传值到UI界面刷新 Model --- > UI
-(void)reloadUI;

@end
