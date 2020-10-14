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
    if([self isAdvertisingTrackingEnabled]) {
        NSUUID *IDFA = [[ASIdentifierManager sharedManager] advertisingIdentifier];
        resolve([IDFA UUIDString]);
    } else {
        resolve(@"");
    }
}

- (BOOL) isAdvertisingTrackingEnabled {
    if (@available(iOS 14, *)) {
        return [ATTrackingManager trackingAuthorizationStatus] == ATTrackingManagerAuthorizationStatusAuthorized;
    } else {
        return [[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];
    }
}

@end
