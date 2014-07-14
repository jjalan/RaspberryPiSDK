//
//  RPISessionManager.m
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/12/14.
//
//

#import "RPISessionManager.h"
#import <NMSSH/NMSSH.h>
#import "RPINMSSHErrorHandler.h"

@interface RPISessionManager()
@property (nonatomic, strong) RPIDevice* device;
@property (nonatomic, strong) NMSSHSession* session;
@end

@implementation RPISessionManager

-(instancetype)initWithDevice:(RPIDevice*)device
{
    NSAssert(device != nil, @"Please pass a valid device");
    
    self = [super init];
    
    if(self)
    {
        self.device = device;
    }
    
    return self;
}

-(NSString*)executeCommand:(NSString*)command
                     error:(NSError**)error
{
    NSAssert([command length] > 0, @"Please pass a valid command");
    
    NMSSHSession* session = [self getSessionWithError:error];
    if(session != nil)
    {
        return [session.channel execute:command
                                  error:error];
    }
    else
    {
        return nil;
    }
}

-(void)dealloc
{
    if(self.session != nil
       && self.session.isConnected)
    {
        [self.session disconnect];
    }
}

#pragma mark - Private Helper
-(NMSSHSession*)getSessionWithError:(NSError**)error
{
    if(self.session == nil)
    {
        self.session = [NMSSHSession connectToHost:self.device.ipAddress
                                      withUsername:self.device.username];
        
        if (self.session.isConnected)
        {
            [self.session authenticateByPassword:self.device.password];
            if (!self.session.isAuthorized)
            {
                [self.session disconnect];
                self.session = nil;
                
                if(error != nil)
                {
                    *error = [[RPINMSSHErrorHandler sharedInstance] lastError];
                }
            }
        }
        else
        {
            self.session = nil;
            
            if(error != nil)
            {
                *error = [[RPINMSSHErrorHandler sharedInstance] lastError];
            }
        }
    }
    
    return self.session;
}

@end
