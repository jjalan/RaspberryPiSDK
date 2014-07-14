//
//  RPIDevice.m
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import "RPIDevice.h"

@interface RPIDevice()
@property (nonatomic, copy) NSString* ipAddress;
@property (nonatomic, copy) NSString* macAddress;
@property (nonatomic, strong) NSDate* lastDiscovered;
@property (nonatomic, copy) NSString* username;
@property (nonatomic, copy) NSString* password;
@end

@implementation RPIDevice

-(id)initWithIpAddress:(NSString*)ipAddress
            macAddress:(NSString*)macAddress
        lastDiscovered:(NSDate*)lastDiscovered
{
    NSAssert([ipAddress length]>0, @"A valid ip address is required.");
    NSAssert([macAddress length]>0, @"A valid mac address is required.");
    
    self = [super init];
    
    if(self)
    {
        self.ipAddress = ipAddress;
        self.macAddress = macAddress;
        self.lastDiscovered = lastDiscovered;
        
        // hard code user name and password
        // TODO jjalan: obtain this from raspberry pi
        self.username = @"pi";
        self.password = @"raspberry";
        
    }
    
    return self;
}

@end
