//
//  ViewController.m
//  MVP
//
//  Created by 阿飞 on 2019/2/20.
//  Copyright © 2019年 阿飞. All rights reserved.
//

#import "ViewController.h"
#import "MVPViewController.h"
#import "MVVMViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[[MVPViewController alloc]init]  ---  mvp
    //[[MVPViewController alloc]init]
    [self.navigationController pushViewController:[[MVVMViewController alloc]init] animated:NO];
    
    
    
}


@end
