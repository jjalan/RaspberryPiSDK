//
//  RPIDiscoveryManager.m
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import "RPIDiscoveryManager.h"
#import "RPILocalDeviceDiscoveryManager.h"

NSString* const RPIDeviceInNetworkUpdated = @"RPIDeviceInNetworkUpdated";

@interface RPIDiscoveryManager()<RPIDeviceDiscoveryManagerCallback>
@property (nonatomic, strong) NSMutableDictionary* deviceList;
@property (nonatomic, assign) RPIDiscoveryManagerState currentState;
@property (nonatomic, strong) NSTimer* discoveryTimer;
@property (nonatomic, strong) id<RPIDeviceDiscoveryManager> deviceDiscoveryManager;

@end

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

-(instancetype)init
{
    self = [super init];
    
    if(self)
    {
        self.currentState = RPIDiscoveryManagerStateUnknown;
        
        self.deviceList = [NSMutableDictionary dictionary];
        
        // TODO jjalan: Use dependency injection
        self.deviceDiscoveryManager = [[RPILocalDeviceDiscoveryManager alloc] init];
        [self.deviceDiscoveryManager setDelegate:self];
        
    }
    
    return self;
}

-(void)startDiscovery
{
    NSAssert(self.currentState == RPIDiscoveryManagerStateUnknown ||
             self.currentState == RPIDiscoveryManagerStateIdle ,
             @"Please make sure to call stop discovery before starting it again");
    
    self.currentState = RPIDiscoveryManagerStateDiscovering;
    
    static const NSTimeInterval DiscoveryTimeInSeconds = 30.0f;
    self.discoveryTimer = [NSTimer scheduledTimerWithTimeInterval:DiscoveryTimeInSeconds
                                                           target:self.deviceDiscoveryManager
                                                         selector:@selector(startDiscovery)
                                                         userInfo:nil
                                                          repeats:YES];
    
    // kick off immediately
    [self.deviceDiscoveryManager startDiscovery];
    
}

-(void)stopDiscovery
{
    if(self.discoveryTimer != nil)
    {
        [self.discoveryTimer invalidate];
        self.discoveryTimer = nil;
    }
    
    self.currentState = RPIDiscoveryManagerStateIdle;
    
    [self.deviceDiscoveryManager stopDiscovery];
}

-(RPIDiscoveryManagerState)state
{
    return self.currentState;
}

-(NSArray*)devicesInNetwork
{
    return [self.deviceList allValues];
}

#pragma mark - RPIDeviceDiscoveryManagerCallback
-(void)onRPIDeviceDiscoveryManagerStared
{
}
-(void)onRPIDeviceDiscovered:(RPIDevice*)device
{
    BOOL raiseNotification = NO;
    RPIDevice* d = [self.deviceList objectForKey:device.macAddress];
    
    if(d == nil)
    {
        [self.deviceList setObject:device forKey:device.macAddress];
        raiseNotification = YES;
    }
    else{
        
        // raise notification if ipaddress is different
        if([d.ipAddress length] > 0
           && [device.ipAddress length] > 0
           && device)
    }
}
-(void)onRPIDeviceDiscoveryManagerCompleted
{
}

@end
