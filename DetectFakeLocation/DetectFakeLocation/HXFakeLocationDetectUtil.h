//
//  HXFakeLocationDetectUtil.h
//  WPSFehorizon
//
//  Created by Horizon on 2021/8/6.
//  Copyright © 2021 fehorizon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface HXFakeLocationDetectUtil : NSObject

+ (instancetype)util;
@property (nonatomic, copy) void(^ resultCallback)(BOOL isSuspecious);

+ (void)exchangeCLLocationManagerDelegateMethods:(Class)aClass;
+ (void)exchangeCLLocationManagerMethods;

@end

