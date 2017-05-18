//
//  SnsPlatform.m
//  TinyPlus
//
//  Created by xiangfp on 15/6/24.
//  Copyright (c) 2015年 Sunline. All rights reserved.
//

#import "TPSnsPlatform.h"

@implementation TPSnsPlatform

@synthesize platformName;
@synthesize success;
@synthesize error;
@synthesize shareContent;

-(id)init
{
    if(self = [super init]) {
        Class TinyPlus=NSClassFromString(@"TinyPlus");
        if(TinyPlus){
            id tinyPlusInPod  =  [[TinyPlus alloc] init];
            if([tinyPlusInPod respondsToSelector:@selector(getViewController)]){
                self.viewController =[tinyPlusInPod performSelector:@selector(getViewController)];
            }
        }
    }
    return self;
}

-(void)login
{
//    NSAssert(_viewController, @"viewController must not be nil.");
    UMSocialPlatformType  Platform = -2;
    if ([platformName isEqualToString:@"wxsession"]) {
        Platform = UMSocialPlatformType_WechatSession;
    }
    else if([platformName isEqualToString:@"qq"])
    {
        Platform = UMSocialPlatformType_QQ;
    }
    else if([platformName isEqualToString:@"sina"]){
        Platform = UMSocialPlatformType_Sina;
    }
    
    [self getUserInfoForPlatform:Platform];
}

- (void)getUserInfoForPlatform:(UMSocialPlatformType)platformType
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:platformType currentViewController:self.viewController completion:^(id result, NSError *error) {
        UMSocialUserInfoResponse *resp = result;
        // 第三方登录数据(为空表示平台未提供)
        // 授权数据
        NSLog(@" uid: %@", resp.uid);
        NSLog(@" openid: %@", resp.openid);
        NSLog(@" accessToken: %@", resp.accessToken);
        NSLog(@" refreshToken: %@", resp.refreshToken);
        NSLog(@" expiration: %@", resp.expiration);
        
        // 用户数据
        NSLog(@" name: %@", resp.name);
        NSLog(@" iconurl: %@", resp.iconurl);
        NSLog(@" gender: %@", resp.gender);
        
        // 第三方平台SDK原始数据
        NSLog(@" originalResponse: %@", resp.originalResponse);
        
        
        if(error!=nil){
            [self.error callWithArguments:@[@"失败"]];
        }
        else{
            
            NSString *json = [NSString stringWithFormat:@"{\"unionid\":\"%@\", \"access_token\":\"%@\"}", resp.uid, resp.accessToken];
            NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
            NSError *err;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&err];
            [self.success callWithArguments:@[@"成功",dic]];
        }
    }];
}



@end
