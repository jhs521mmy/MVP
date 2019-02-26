//
//  MVVMViewController.m
//  MVP
//
//  Created by 阿飞 on 2019/2/25.
//  Copyright © 2019年 阿飞. All rights reserved.
//

#import "MVVMViewController.h"
#import "JAFTableViewDataSource.h"
#import "MVPTableViewCell.h"
#import "Model.h"
#import "PresentProtocolDelegate.h"
#import "MVVMViewModel.h"
static NSString *const cellReuserID = @"cellReuserID";
@interface MVVMViewController ()<UITableViewDelegate,UITableViewDataSource,PresentProtocolDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) MVVMViewModel *vm;

@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vm = [[MVVMViewModel alloc]init];
  
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
      __weak typeof(self) weakSelf = self;
    
    [self.vm initWithBlock:^(id data) {
        
        [weakSelf.dataArray removeAllObjects];
        
        [weakSelf.dataArray addObjectsFromArray:data];
        
        [weakSelf.tableView reloadData];
        
    } fail:^(id data) {
       
        
    }];
   //加载数据
    [self.vm loadData];
 
}
- (UITableView *)tableView{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellReuserID];
    }
    return _tableView;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuserID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",self.dataArray[indexPath.row]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.vm.contentKey = self.dataArray[indexPath.row];

}
- (NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        self.dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
    
}

@end
