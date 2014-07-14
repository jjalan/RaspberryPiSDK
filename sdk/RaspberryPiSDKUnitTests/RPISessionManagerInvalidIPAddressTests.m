//
//  RPISessionManagerExecuteCommandTests.m
//  RaspberryPiSDK
//
//  Created by Jaikishan Jalan on 7/13/14.
//
//

#import <XCTest/XCTest.h>
#import "RPIDevice.h"
#import "RPISessionManager.h"

@interface RPISessionManagerInvalidIPAddressTests : XCTestCase

@end

@implementation RPISessionManagerInvalidIPAddressTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBadIPAddress
{
    RPIDevice* rpiDevice = [[RPIDevice alloc] initWithIpAddress:@"192.168.1"
                                                     macAddress:@"address"
                                                 lastDiscovered:[NSDate date]];
    
    RPISessionManager* sessionManager = [[RPISessionManager alloc] initWithDevice:rpiDevice];
    NSError* error = nil;
    
    [sessionManager executeCommand:@"ls l" error:&error];
    
    XCTAssertNotNil(error, @"error should not be nil");
}

@end
