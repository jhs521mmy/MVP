//
//  ViewController.m
//  MVP
//
//  Created by 阿飞 on 2019/2/20.
//  Copyright © 2019年 阿飞. All rights reserved.
//

#import "ViewController.h"
#import "MVPViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController pushViewController:[[MVPViewController alloc]init] animated:NO];
    
}


@end
