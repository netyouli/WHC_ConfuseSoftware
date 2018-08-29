//
//  WHC_AutoLayout.h
//  WHC_AutoLayoutKit
//
//  Github <https://github.com/netyouli/WHC_AutoLayoutKit>
//
//  Created by WHC on 17/4/8.
//  Copyright © 2017年 吴海超. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>

//! Project version number for WHC_AutoLayout.
FOUNDATION_EXPORT double WHC_AutoLayoutVersionNumber;

//! Project version string for WHC_AutoLayout.
FOUNDATION_EXPORT const unsigned char WHC_AutoLayoutVersionString[];

#define WHC_AutoLayoutKitRelease 0

#if WHC_AutoLayoutKitRelease

#import <WHC_AutoLayoutKit/WHC_StackView.h>
#import <WHC_AutoLayoutKit/UITableViewCell+WHC_AutoHeightForCell.h>
#import <WHC_AutoLayoutKit/UIView+WHC_AutoLayout.h>
#import <WHC_AutoLayoutKit/UIView+WHC_Frame.h>
#import <WHC_AutoLayoutKit/CALayer+WHC_Frame.h>
#import <WHC_AutoLayoutKit/UILayoutGuide+WHC_AutoLayout.h>

#else

#import "WHC_StackView.h"
#import "UITableViewCell+WHC_AutoHeightForCell.h"
#import "UIView+WHC_AutoLayout.h"
#import "UIView+WHC_Frame.h"
#import "CALayer+WHC_Frame.h"
#import "UILayoutGuide+WHC_AutoLayout.h"

#endif



