//
//  RPIDeviceDiscoveryManager.h
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import "RPIDevice.h"
#import <Foundation/Foundation.h>
#import "RPIDiscoveryManagerStatus.h"

@protocol RPIDeviceDiscoveryManagerCallback <NSObject>
@required
-(void)onRPIDeviceDiscoveryManagerStared;
-(void)onRPIDeviceDiscovered:(RPIDevice*)device;
-(void)onRPIDeviceDiscoveryManagerCompleted;
@end

@protocol RPIDeviceDiscoveryManager <NSObject>
@required
-(void)startDiscovery;
-(void)stopDiscovery;
-(void)setDelegate:(id<RPIDeviceDiscoveryManagerCallback>)delegate;
@end


