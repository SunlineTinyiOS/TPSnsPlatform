//
//  SnsPlatform.h
//  TinyPlus
//
//  Created by xiangfp on 15/6/24.
//  Copyright (c) 2015年 Sunline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>
#import <JavaScriptCore/JSExport.h>
#import <UIKit/UIKit.h>

@protocol TPSnsPlatformProtocol <JSExport>

/**
 *  平台名称
 *  wxsession:微信好友
 *  sina:微博
 *  qq:qq
 */
@property(nonatomic, strong) NSString *platformName;

/**
 *  分享内容
 */
@property(nonatomic, strong) NSString *shareContent;

@property(nonatomic, strong) JSValue *success;

@property(nonatomic, strong) JSValue *error;

/**
 *  第三方登陆
 */
- (void)login;



@end


@interface TPSnsPlatform : NSObject<TPSnsPlatformProtocol>

@property(nonatomic, strong) UIViewController *viewController;


@end
