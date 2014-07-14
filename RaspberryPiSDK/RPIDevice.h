//
//  RPIDevice.h
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import <Foundation/Foundation.h>

@interface RPIDevice : NSObject

-(id)initWithIpAddress:(NSString*)ipAddress
            macAddress:(NSString*)macAddress
        lastDiscovered:(NSDate*)lastDiscovered;

-(NSString*)ipAddress;
-(NSString*)macAddress;
-(NSDate*)lastDiscovered;
-(NSString*)username;
-(NSString*)password;

@end
