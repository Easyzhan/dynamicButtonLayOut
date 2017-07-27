//
//  ActivityTagView.h
//  TestDynaButton
//
//  Created by Zin_戦 on 2017/7/27.
//  Copyright © 2017年 Zin_戦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityTagView : UIView
@property (nonatomic ,strong)NSArray *arr;
- (void)setUPView;
- (instancetype)initWithFrame:(CGRect)frame array:(NSArray *)array;


@end
