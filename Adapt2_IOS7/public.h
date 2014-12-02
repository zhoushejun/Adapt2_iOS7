//
//  public.h
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
 
 @brief         public macro define || global macro define
 */

/** @name DEBUG 模式下打印日志和当前行数 */
// @{
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content--->>> \n%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif
// @}end of DEBUG 模式下打印日志和当前行数

/** @name 获取屏幕 宽度、高度 */
// @{
/** @attention 勿删 */
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// @}end of 获取屏幕 宽度、高度

/** @name version */
// @{
#define CurrentDevice [UIDevice currentDevice]
#define CurrentSystemVersion [CurrentDevice systemVersion]
#define IOS_VERSION [CurrentSystemVersion floatValue]
// @}end of version

/** @name 状态栏 高度 */
// @{
#define STATUSBAR_HEIGHT (IOS_VERSION < 7.0?20:0)
// @}end of 状态栏 高度

//背景色
#define BLACK_BACKGROUND_COLOR [UIColor colorWithRed:0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]
/** 索引 背景颜色 */
#define INDEX_BUTTON_BACKGROUND_COLOR [UIColor colorWithRed:255/255.0 green:114/255.0 blue:110/255.0 alpha:1.0]
/** 线条 灰色 */
#define LINE_GRAY_COLOR [UIColor colorWithRed:226/255.0 green:226/255.0 blue:217/255.0 alpha:1]
/** 导航 背景色   浅蓝色 */
#define BLUE_COLOR_Nav [UIColor colorWithRed:72/255.0  green:188/255.0 blue:235/255.0 alpha:1.0]

