//
//  FriendModel.h
//  WHC_AutoLayoutExample
//
//  Created by 吴海超 on 16/3/10.
//  Copyright © 2016年 吴海超. All rights reserved.
//

/*********************************************************
 *  gitHub:https://github.com/netyouli/WHC_AutoLayoutKit *
 *  本人其他优秀开源库：https://github.com/netyouli          *
 *********************************************************/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Answer : NSObject
@property (nonatomic ,copy) NSString * name;
@property (nonatomic ,copy) NSString * content;
@property (nonatomic ,assign)BOOL isReply;
@end

@interface FriendModel : NSObject
@property (nonatomic ,copy) NSString * content;
@property (nonatomic ,copy) NSString * userImage;
@property (nonatomic ,copy) NSString * userName;
@property (nonatomic ,copy) NSArray  * imageArray;
@property (nonatomic ,strong) NSMutableArray  * answerArray;
@property (nonatomic ,assign) BOOL  isSupper;
@end
