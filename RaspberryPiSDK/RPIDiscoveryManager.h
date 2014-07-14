//
//  RPIDiscoveryManager.h
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

FOUNDATION_EXPORT NSString* const RPIDeviceInNetworkUpdated;

#import <Foundation/Foundation.h>
#import "RPIDiscoveryManagerStatus.h"

@interface RPIDiscoveryManager : NSObject

+ (instancetype)sharedManager;

-(void)startDiscovery;
-(void)stopDiscovery;

-(NSArray*)devicesInNetwork;
-(RPIDiscoveryManagerState)state;

@end
