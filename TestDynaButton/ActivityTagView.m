//
//  ActivityTagView.m
//  TestDynaButton
//
//  Created by Zin_戦 on 2017/7/27.
//  Copyright © 2017年 Zin_戦. All rights reserved.
//

#import "ActivityTagView.h"
#import "UIView+Extension.h"

#define WINDOW_HEIGHT               [UIScreen mainScreen].bounds.size.height
#define WINDOW_WIDTH                [UIScreen mainScreen].bounds.size.width
#define VDColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define VDRandomColor VDColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ActivityTagView()
@property(nonatomic, strong) UIButton   *tempButton;

@end

@implementation ActivityTagView

- (instancetype)initWithFrame:(CGRect)frame array:(NSArray *)array
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = VDRandomColor;
        NSInteger countView = 13;//总数
        NSInteger column = 4;//一行几列
        NSInteger rowNum = countView/column;//正好oneRowNo一行的行数
        NSInteger yuShu = countView%column;//余数
        rowNum = yuShu>0?rowNum+1:rowNum;
        
        CGFloat spaceMarginX = 10;//控件间距
        CGFloat  spaceMarginY = 10;//y方向上的间距
        CGFloat leftOrRightMargin = 10;//左右距离
        CGFloat topMargin = 40;//顶部距离
        CGFloat btW = (WINDOW_WIDTH -2*leftOrRightMargin - (column-1)*spaceMarginX)/column;//控件的(宽=高)
        CGFloat btH = btW;
        
        for (int i = 0; i<rowNum; i++) {
            NSInteger rowY = i*(btH + spaceMarginY) + topMargin;
            
            NSInteger numIndex = column;
            column = (i == rowNum -1&&yuShu>0)?yuShu:column;
            for (int j = 0; j<column; j++) {
                
                UIButton *buT = [UIButton new];
                buT.backgroundColor = VDRandomColor;
                buT.tag = (i*numIndex+j);
                [buT addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
                buT.width = btW;
                buT.height = btH;
                buT.x = j*(btW + spaceMarginX) + leftOrRightMargin;
                buT.y = rowY;
                NSLog(@"----all Y size = %lf",CGRectGetMaxY(buT.frame));
                _tempButton = buT;
                
                [self addSubview:buT];
            }
        }
    }
    return self;
}

- (void)layoutSubviews{

    self.height = CGRectGetMaxY(_tempButton.frame) + 20;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti2" object:@(self.height)];
}

- (void)butClick:(UIButton *)sender{
    
    NSLog(@"----%ld---tempButton =%f",sender.tag,CGRectGetMaxY(_tempButton.frame));
}



@end
