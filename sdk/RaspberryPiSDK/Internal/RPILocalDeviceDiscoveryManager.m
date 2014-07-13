//
//  RPILocalDeviceDiscoveryManager.m
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import "RPILocalDeviceDiscoveryManager.h"

@interface RPILocalDeviceDiscoveryManager()
@property (nonatomic, weak) id<RPIDeviceDiscoveryManagerCallback> delegate;
@end

@implementation RPILocalDeviceDiscoveryManager

-(void)startDiscovery
{
}

-(void)stopDiscovery
{
}

-(void)setDelegate:(id<RPIDeviceDiscoveryManagerCallback>)delegate
{
    self.delegate = delegate;
}

@end
