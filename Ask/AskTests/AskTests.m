//
//  AskTests.m
//  AskTests
//
//  Created by lee on 2018/12/19.
//  Copyright © 2018 lee. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AskTests : XCTestCase

@end

@implementation AskTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
	NSArray *random = [self randomNumbers];
	NSLog(@"random: %@", random);
}

- (NSArray *)randomNumbers
{
	NSArray *even = [self evenArray];
	NSLog(@"even: %@", even);
	
	NSArray *uneven = [self unevenArray];
	NSLog(@"uneven: %@", uneven);
	
	NSMutableArray *array = [NSMutableArray array];
	[array addObjectsFromArray:even];
	[array addObjectsFromArray:uneven];
	
	NSArray *idxArray = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9];
	NSMutableArray *idxArray = [NSMutableArray array];
	[idxArray addObjectsFromArray:idxTempArray];
	
	NSMutableArray *resultArray = [NSMutableArray array];
	for (NSInteger i=0; i<9; i++) {
		NSInteger idx = arc4random()%idxTempArray.count;
		[resultArray addObject:array[idx]];
		
	}

	return [NSArray arrayWithArray:array];
}

- (NSArray *)evenArray
{
	return [self numArrayIsEven:YES];
}

- (NSArray *)unevenArray
{
	return [self numArrayIsEven:NO];
}

- (NSArray *)numArrayIsEven:(BOOL)even
{
	NSInteger result = even?0:1;
	NSInteger count = even?4:5;
	
	NSMutableArray *totalArray = [NSMutableArray array];
	for (NSInteger i=1; i<100; i++) {
		if (i%2==result) {
			[totalArray addObject:@(i)];
		}
	}
	
	NSMutableArray *tempArray = [NSMutableArray array];
	[tempArray addObjectsFromArray:totalArray];
	
	NSMutableArray *resultArray = [NSMutableArray array];
	for (NSInteger i=0; i<count; i++) {
		NSInteger random = arc4random()%(tempArray.count);
		[resultArray addObject:tempArray[random]];
		[tempArray removeObjectAtIndex:random];
	}
	
	return [NSArray arrayWithArray:resultArray];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
