//
//  WHC_AutoLayoutUtilities.h
//  WHC_AutoLayoutKit
//
//  Created by WHC on 17/4/12.
//  Copyright © 2017年 WHC. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_IPHONE || TARGET_OS_TV

#define WHC_CLASS_VIEW UIView
#define WHC_CLASS_LGUIDE UILayoutGuide

#define WHC_VIEW NSObject
#define WHC_LayoutPriority UILayoutPriority
#define WHC_ConstraintAxis UILayoutConstraintAxis
#define WHC_COLOR UIColor
#import <UIKit/UIKit.h>

#elif TARGET_OS_MAC
#define WHC_CLASS_VIEW NSView
#define WHC_CLASS_LGUIDE NSLayoutGuide

#define WHC_VIEW NSObject
#define WHC_LayoutPriority NSLayoutPriority
#define WHC_ConstraintAxis NSLayoutConstraintOrientation
#define WHC_COLOR NSColor
#import <AppKit/AppKit.h>

#endif
