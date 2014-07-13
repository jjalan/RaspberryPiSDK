//
//  RPISessionManager.m
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import "RPISessionManager.h"

@implementation RPISessionManager

+ (instancetype)sharedManager
{
    static RPISessionManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}


@end
