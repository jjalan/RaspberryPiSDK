//
//  RPINMSSHErrorHandler.h
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import <Foundation/Foundation.h>

@interface RPINMSSHErrorHandler : NSObject

+(instancetype)sharedInstance;
-(NSError*)lastError;

@end
