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

@implementation PTRIDFA

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXPORT_METHOD(getIDFA:(RCTPromiseResolveBlock)resolve
                  rejecter:(__unused RCTPromiseRejectBlock)reject)
{
    NSUUID *IDFA = [[ASIdentifierManager sharedManager] advertisingIdentifier];
    resolve([IDFA UUIDString]);
}

@end
