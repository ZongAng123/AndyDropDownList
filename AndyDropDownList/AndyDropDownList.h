//
//  AndyDropDownList.h
//  AndyDropDownList
//
//  Created by 纵昂 on 2017/2/24.
//  Copyright © 2017年 纵昂. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AndyDropDownDelegate <NSObject>
//代理
-(void)dropDownListParame:(NSString *)aStr;
@end
@interface AndyDropDownList : UIView
/**
 *  下拉列表
 *  @param array       数据源
 *  @param rowHeight   行高
 *  @param v           控制器>>>可根据需求修改
 */
-(id)initWithListDataSource:(NSArray *)array
                  rowHeight:(CGFloat)rowHeight
                       view:(UIView *)v;

/**
 *  设置代理
 */
@property(nonatomic,assign)id<AndyDropDownDelegate>delegate;

/**
 *   显示下拉列表
 */
-(void)showList;
/**
 *   隐藏
 */
-(void)hiddenList;
@end
