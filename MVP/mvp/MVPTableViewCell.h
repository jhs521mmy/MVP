//
//  MVPTableViewCell.h
//  MVP
//
//  Created by 阿飞 on 2019/2/21.
//  Copyright © 2019年 阿飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PresentProtocolDelegate.h"
@interface MVPTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *subBtn;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, assign) int num;
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, weak) id<PresentProtocolDelegate>delegate;//声明协议变量

@end
