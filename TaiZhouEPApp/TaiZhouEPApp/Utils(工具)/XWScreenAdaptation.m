//
//  XWScreenAdaptation.m
//  TaiZhouEPApp
//
//  Created by shengxinwei on 2019/11/25.
//  Copyright © 2019 snew. All rights reserved.
//

#import "XWScreenAdaptation.h"

@implementation XWScreenAdaptation

//iphone XS Max, 11 pro Max
+ (CGSize)sizeFor65Inch{
    return CGSizeMake(414,896);
}

//iphone XR,11
+ (CGSize)sizeFor61Inch{
    return CGSizeMake(414,896);
}

// iphone X,11 pro
+ (CGSize)sizeFor58Inch{
    return CGSizeMake(375,812);
}

//iphone 6p,7p,8p
+ (CGSize)sizeFor55Inch {
    return CGSizeMake(414,736);
}

//iphone 6,6s,7,8
+ (CGSize)sizeFor47Inch {
    return CGSizeMake(375,667);
}

//iphone 5,5s
+ (CGSize)sizeFor40Inch {
    return CGSizeMake(320,568);
}

//iphone 4,4s
+ (CGSize)sizeFor35Inch {
    return CGSizeMake(320,480);
}



@end
