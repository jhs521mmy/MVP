//
//  MVPViewController.m
//  MVP
//
//  Created by 阿飞 on 2019/2/20.
//  Copyright © 2019年 阿飞. All rights reserved.
//

#import "MVPViewController.h"
#import "JAFTableViewDataSource.h"
#import "MVPTableViewCell.h"
#import "Present.h"
#import "Model.h"
#import "PresentProtocolDelegate.h"
static NSString *const cellReuserID = @"cellReuserID";
@interface MVPViewController ()<UITableViewDelegate,PresentProtocolDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) Present *pt;
@property (nonatomic, strong) JAFTableViewDataSource *dataSource;

@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pt = [[Present alloc]init];
    __weak typeof(self) weakSelf = self;
    self.dataSource = [[JAFTableViewDataSource alloc]initWithCellIdentifier:cellReuserID tableViewCellBlock:^(MVPTableViewCell *cell, Model *model, NSIndexPath *indexPath) {
    
        cell.nameLabel.text = model.name;
        cell.numLabel.text  = model.num;
        cell.indexPath      = indexPath;
        cell.delegate       = weakSelf.pt;
        
    } selectCell:^(NSIndexPath *indexPath) {
        
        
        
    }];
    [self.dataSource addDataArray:self.pt.dataArray];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    self.pt.delegate = self;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[MVPTableViewCell class] forCellReuseIdentifier:cellReuserID];
    }
    return _tableView;
}
#pragma mark --- PresentProtocolDelegate
-(void)reloadUI{
    
    [self.dataSource addDataArray:self.pt.dataArray];
    
    [self.tableView reloadData];
}

@end
