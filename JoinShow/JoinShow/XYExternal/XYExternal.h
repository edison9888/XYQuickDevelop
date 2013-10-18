//
//  XYExternal.h
//  JoinShow
//
//  Created by Heaven on 13-8-1.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#ifndef JoinShow_XYExternal_h
#define JoinShow_XYExternal_h



#endif

///////////////////////////////////////////////////////////////
// fmdb
#if (1 == __USED_FMDatabase__)
#import "FMDatabase.h"
#endif

// sqlite 数据库全自动操作
#if (1 == __USED_LKDBHelper__)
#import "LKDBHelper.h"
#endif

// 网络请求
#if (1 ==  __USED_MKNetworkKit__)
#import "MKNetworkKit.h"
#endif

#if (1 ==  __USED_ASIHTTPRequest__)
#import "ASIHTTPRequest.h"
#endif

// json to object , object to json
#if (1 ==  __USED_MBProgressHUD__)
#import "YYJSONHelper.h"
#endif

// cocos2d 音频引擎
#if (1 == __USED_CocosDenshion__)
#import "SimpleAudioEngine.h"
#endif

#if (1 == __USED_OpenUDID__)
#import "OpenUDID.h"
#endif



///////////////////////////////////////////////////////////////
// 下拉键盘在iOS移动文本字段的通用解决方案
#if (1 == __USED_IQKeyBoardManager__)
#import "IQKeyBoardManager.h"
#endif

// 状态指示器
#if (1 == __USED_MBProgressHUD__)
#import "MBProgressHUD.h"
#endif


// 富文本
#if (1 == __USED_RTLabel__)
#import "RTLabel.h"
#endif

///////////////////////////////////////////////////////////////
// dyci.embeddedframework
// 运行时修改代码, 发布的是需要删除
