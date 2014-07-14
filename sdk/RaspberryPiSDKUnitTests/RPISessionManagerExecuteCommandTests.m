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


@interface RPISessionManagerExecuteCommandTests : XCTestCase

@end

@implementation RPISessionManagerExecuteCommandTests

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

- (void)testExecuteCommand
{
    RPIDevice* rpiDevice = [[RPIDevice alloc] initWithIpAddress:@"192.168.1.15"
                                                     macAddress:@"address"
                                                 lastDiscovered:[NSDate date]];
    
    RPISessionManager* sessionManager = [[RPISessionManager alloc] initWithDevice:rpiDevice];
    NSError* error = nil;
    
    NSString* result = [sessionManager executeCommand:@"ls" error:&error];
    XCTAssertNil(error, @"error should be nil");
    
    XCTAssertTrue([result length] > 0, @"It should result in a non empty string");
}

@end
