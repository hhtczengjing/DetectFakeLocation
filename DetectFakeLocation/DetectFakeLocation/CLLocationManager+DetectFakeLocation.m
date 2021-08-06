//
//  CLLocationManager+DetectFakeLocation.m
//  WPSLocation
//
//  Created by Horizon on 2021/8/6.
//

#import "CLLocationManager+DetectFakeLocation.h"
#import <CoreLocation/CoreLocation.h>
#import "HXFakeLocationDetectUtil.h"
#import <objc/runtime.h>

@implementation CLLocationManager (DetectFakeLocation)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 交换CoreLocation中的代理方法
        Method originalMethod = class_getInstanceMethod(self, @selector(setDelegate:));
        Method exchangeMethod = class_getInstanceMethod(self, @selector(hk_setDelegate:));
        method_exchangeImplementations(originalMethod, exchangeMethod);

    });
}

- (void)hk_setDelegate:(id<CLLocationManagerDelegate>)delegate {
    [self hk_setDelegate:delegate];
    
    // 获得delegate的实际调用类
    Class aClass = [delegate class];
    // 传递给HXFakeLocationDetectUtil来交互方法
    [HXFakeLocationDetectUtil exchangeCLLocationManagerMethods];
    [HXFakeLocationDetectUtil exchangeCLLocationManagerDelegateMethods:aClass];
}


@end
