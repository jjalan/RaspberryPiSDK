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
@end

@implementation RPIDevice

-(id)initWithIpAddress:(NSString*)ipAddress
{
    self = [super init];
    
    if(self)
    {
        self.ipAddress = ipAddress;
    }
    
    return self;
}

@end
