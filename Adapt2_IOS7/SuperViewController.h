//
//  SuperViewController.h
//  Adapt_IOS7
//
//  Created by zhoushejun on 14-6-21.
//  Copyright (c) 2014年 zhou. All rights reserved.
//

/**
 @file          <#file#>
 
 @author		shejun.zhou
 @version		<#version#>
 @date          2014-6-21
 @copyright     <#copyright. All rights reserved.#>
 
 @brief         super viewController
 */

#import <UIKit/UIKit.h>
#import "public.h"

@interface SuperViewController : UIViewController

@property (nonatomic, strong) UIView *contentView;          ///< contentView
@property (nonatomic, retain) UILabel  *labTitle;           ///< title
@property (nonatomic, retain) UIButton *btnLeft;            ///< left goback
@property (nonatomic, retain) UIButton *btnRight;           ///< right gonext

/** @name btn press action */
// @{
- (void)leftGoBack:(id)sender;
- (void)rightGoNext:(id)sender;
// @}end of btn press action

@end
