//
//  GMPieChartView.h
//  pieChatTest
//
//  Created by sunny on 2017/8/18.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMPieChartView : UIView

/// 传入的分块数值  内容为比例   总和为1
@property (nonatomic , strong) NSArray * arrPieces;

/// 传入的每块的色值
@property (nonatomic , strong) NSArray * arrColors;

/// 饼状图的宽度
@property (nonatomic , assign) CGFloat pieWith;

@end
