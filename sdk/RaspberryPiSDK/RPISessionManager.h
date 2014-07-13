//
//  RPISessionManager.h
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import <Foundation/Foundation.h>
#import "RPIDevice.h"

@interface RPISessionManager : NSObject

-(instancetype)initWithDevice:(RPIDevice*)device;

-(NSString*)executeCommand:(NSString*)command
                     error:(NSError**)error;

@end
