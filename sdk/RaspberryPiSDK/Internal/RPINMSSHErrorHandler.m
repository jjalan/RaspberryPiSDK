//
//  RPINMSSHErrorHandler.m
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import "RPINMSSHErrorHandler.h"
#import <NMSSH/NMSSH.h>
#import "RPIError.h"

@interface RPINMSSHErrorHandler()
@property (nonatomic, strong) NSError* lastError;
@end

@implementation RPINMSSHErrorHandler

+ (void) initialize
{
    [[NMSSHLogger logger] setLogBlock:^(NMSSHLogLevel level, NSString *format) {
        
        NSString* message = [NSString stringWithFormat:@"%@", format];
        if(level == NMSSHLogLevelError){
            
            // TODO jjalan: Add error codes.
            [RPINMSSHErrorHandler sharedInstance].lastError = [NSError errorWithDomain:RPIErrorDomain
                                                                                  code:0
                                                                              userInfo:@{NSLocalizedDescriptionKey:message}];
        }
        
        NSLog(@"%@", message);
        
    }];
}

+ (instancetype)sharedInstance
{
    static RPINMSSHErrorHandler *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

@end
