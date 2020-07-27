//
//  PTRIDFA.m
//  IDFA
//
//  Created by Tomas Roos on 22/07/16.
//  Copyright © 2016 Tomas Roos. All rights reserved.
//

#import "PTRIDFA.h"
#import <React/RCTUtils.h>
#import <UIKit/UIKit.h>
@import AdSupport;
@import AppTrackingTransparency;

@implementation PTRIDFA

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(getIDFA:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    if([[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled]) {
        NSUUID *IDFA = [[ASIdentifierManager sharedManager] advertisingIdentifier];
        resolve([IDFA UUIDString]);
    } else {
        resolve(@"");
    }
}

RCT_EXPORT_METHOD(requestTrackingPermission:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
{
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            switch (status) {
                case ATTrackingManagerAuthorizationStatusNotDetermined:
                    resolve(@"not_determined");
                    break;
                    
                case ATTrackingManagerAuthorizationStatusAuthorized:
                    resolve(@"authorized");
                    break;
                    
                case ATTrackingManagerAuthorizationStatusDenied:
                case ATTrackingManagerAuthorizationStatusRestricted:
                    resolve(@"denied");
                    break;
            }
        }];
    } else {
        resolve(@"authorized");
    }
}

@end
