//
//  ViewController.m
//  pieChatTest
//
//  Created by 中海智融 on 2017/8/18.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "ViewController.h"
#import "GMPieChartView.h"

@interface ViewController ()

{
    GMPieChartView * _pieView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _pieView = [[GMPieChartView alloc] initWithFrame:CGRectMake(30, 100, 300, 300)];
    
    
    _pieView.arrPieces = @[@(0.4),@(0.3),@(0.2),@(0.1)];
    _pieView.arrColors = @[[UIColor redColor] , [UIColor yellowColor], [UIColor greenColor] , [UIColor cyanColor]];
    
    
    _pieView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_pieView];
    
    [_pieView setNeedsDisplay];
    
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(30, 50, 300, 50);
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitle:@"随机" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)actionClick:(id)s
{
    int max = 100;
    
    NSMutableArray * mArrRandom = [NSMutableArray array];
    NSMutableArray * mArrColor = [NSMutableArray array];
    
    for ( int i = 0; i < 4; i ++)
    {
        int rand = arc4random() % max;
        max -= rand;
        
        if (i == 3) rand = max;
        
        CGFloat randfloat = rand / 100.f;
        
        [mArrRandom addObject:@(randfloat)];
        
        UIColor * color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1.0f];
        [mArrColor addObject:color];
    }
    
    _pieView.arrPieces = [NSArray arrayWithArray:mArrRandom];
    _pieView.arrColors = [NSArray arrayWithArray:mArrColor];
    
    [_pieView setNeedsDisplay];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
