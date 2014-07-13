//
//  RPIDevice.h
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import <Foundation/Foundation.h>

@interface RPIDevice : NSObject

-(id)initWithIpAddress:(NSString*)ipAddress;

-(NSString*)ipAddress;

@end
