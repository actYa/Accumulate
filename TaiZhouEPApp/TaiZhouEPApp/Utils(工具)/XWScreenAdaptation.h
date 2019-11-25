//
//  XWScreenAdaptation.h
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/11/25.
//  Copyright © 2019 snew. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//MARK: - 屏幕适配

//状态栏高度
#define STATUSBAR_HEIGHT  [[UIApplication sharedApplication] statusBarFrame].size.height
//导航栏高度
#define NAVBAR_SUM_HEIGHT  ((IS_IPHONE_X == YES || IS_IPHONE_XR == YES || IS_IPHONE_XS_MAX == YES) ?88:64)
//适配iPhoneX 的高度
#define X_Height(h) ((IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XS_MAX) ? (h+24):h)
//适配iPhoneX 底部
#define X_Bottom(h) ((IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XS_MAX) ? (h+34):h)

//判断横竖屏
#define IS_LANDSCAPE (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation]))
//屏幕物理宽度 and 高度
#define SCREEN_WIDTH (IS_LANDSCAPE ? [[UIScreen mainScreen ] bounds].size.height : [[UIScreen mainScreen ] bounds].size.width)
#define SCREEN_HEIGHT (IS_LANDSCAPE ? [[UIScreen mainScreen ] bounds].size.width : [[UIScreen mainScreen ] bounds].size.height)

//MARK: - 判断 iPhone 机型
#define IS_IPHONE_X_XR_MAX (IS_IPHONE_X || IS_IPHONE_XR || IS_IPHONE_XSMAX)
#define IS_IPHONE_X (SCREEN_WIDTH == [GTScreen sizeFor58Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor58Inch].height)
#define IS_IPHONE_XR (SCREEN_WIDTH == [GTScreen sizeFor61Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor61Inch].height && [UIScreen mainScreen].scale == 2)
#define IS_IPHONE_XSMAX (SCREEN_WIDTH == [GTScreen sizeFor65Inch].width && SCREEN_HEIGHT == [GTScreen sizeFor65Inch].height && [UIScreen mainScreen].scale == 3)
#define IS_IPHONE_4 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)480) < DBL_EPSILON)
#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)568) < DBL_EPSILON)
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

#define STATUSBARHEIGHT (IS_IPHONE_X_XR_MAX ? 44 : 20)

#define UI(x) UIAdapter(x)
#define UIRect(x,y,width,height) UIRectAdapter(x,y,width,height)

static inline NSInteger UIAdapter (float x){
    float currentScreen = [UIScreen mainScreen].bounds.size.width;
    float scale;
    //1 - 分机型 特定的比例
    //2 - 屏幕宽度按比例适配
    if (currentScreen == 375) {
        scale = 1.0;
    }else {
        scale = currentScreen/375;
    }
    return (NSInteger)x * scale;
}

//...完善其他方法..size..rect..origin..
static inline CGRect UIRectAdapter(x,y,width,height){
    return CGRectMake(UIAdapter(x), UIAdapter(y), UIAdapter(width), UIAdapter(height));
}

@interface XWScreenAdaptation : NSObject

//iphone XS Max, 11 pro Max
+ (CGSize)sizeFor65Inch;

//iphone XR,11
+ (CGSize)sizeFor61Inch;

// iphone X,11 pro
+ (CGSize)sizeFor58Inch;

//iphone 6p,7p,8p
+ (CGSize)sizeFor55Inch;

//iphone 6,6s,7,8
+ (CGSize)sizeFor47Inch;

//iphone 5,5s
+ (CGSize)sizeFor40Inch;

//iphone 4,4s
+ (CGSize)sizeFor35Inch;

@end

NS_ASSUME_NONNULL_END
