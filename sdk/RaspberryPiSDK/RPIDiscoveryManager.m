//
//  RPIDiscoveryManager.m
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import "RPIDiscoveryManager.h"

@implementation RPIDiscoveryManager

+ (instancetype)sharedManager
{
    static RPIDiscoveryManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

@end
