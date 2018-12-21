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
	
	NSArray *evenArr = [self evenArray];
	//NSLog(@"even: %@", evenArr);
	
	NSArray *unevenArr = [self unevenArray];
	//NSLog(@"uneven: %@", unevenArr);
	
	NSArray *random = [self randomNumbersEven:evenArr uneven:unevenArr];
	//NSLog(@"random: %@", random);
	
	NSInteger clickEvenSum = 0;
	NSInteger clickUnevenSum = 0;
	for (NSNumber *num in random) {
		NSInteger item = [num integerValue];
		if (item%2 == 0) {
			clickEvenSum = clickEvenSum+item;
		}
		if (item%2!=0) {
			clickUnevenSum = clickUnevenSum+item;
		}
	}
	
	NSInteger even = [self evenSumWithArray:evenArr];
	NSLog(@"even sum: %@ | click even sum: %@", @(even), @(clickEvenSum));
	
	NSInteger uneven = [self unevenSumWithArray:unevenArr];
	NSLog(@"uneven sum: %@ | click uneven sum: %@", @(uneven), @(clickUnevenSum));
	
	XCTAssertEqual(even, clickEvenSum);
	XCTAssertEqual(uneven, clickUnevenSum);

}

- (void)testRandomIdxArray {
	for (NSInteger i=0; i<100; i++) {
		NSArray *idxArray = [self randomIdxArray:@[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9]];
		NSLog(@"%@",idxArray);
	}
}

- (void)testSum {
	NSInteger even = [self evenSumWithArray:[self evenArray]];
	NSLog(@"even sum: %@", @(even));
	
	NSInteger uneven = [self unevenSumWithArray:[self evenArray]];
	NSLog(@"uneven sum: %@", @(uneven));
}

- (NSInteger)evenSumWithArray:(NSArray *)array
{
	return [self sumArray:array];
}

- (NSInteger)unevenSumWithArray:(NSArray *)array
{
	return [self sumArray:array];
}

- (NSInteger)sumArray:(NSArray *)array
{
	NSInteger sum = 0;
	for (NSNumber *num in array) {
		sum = sum + [num integerValue];
	}
	return sum;
}

- (NSArray *)randomNumbersEven:(NSArray *)even uneven:(NSArray *)uneven
{
	NSArray *idxArray = [self randomIdxArray:@[@0,@1,@2,@3,@4,@5,@6,@7,@8]];

	NSMutableArray *array = [NSMutableArray array];
	[array addObjectsFromArray:even];
	[array addObjectsFromArray:uneven];
	
	NSMutableArray *resultArray = [NSMutableArray array];
	for (NSInteger i=0; i<9; i++) {
		NSInteger idx = [idxArray[i] integerValue];
		if (idx < [array count]) {
			[resultArray addObject:array[idx]];
		}else {
			[resultArray addObject:@2];
		}
	}

	return [NSArray arrayWithArray:resultArray];
}

- (NSArray *)randomIdxArray:(NSArray *)array;
{
	
	
	NSMutableArray *tempArray = [NSMutableArray array];
	[tempArray addObjectsFromArray:array];
	
	NSMutableArray *idxArray = [NSMutableArray array];
	for (NSInteger i=0; i<array.count; i++) {
		NSInteger idx = arc4random()%tempArray.count;
		[idxArray addObject:tempArray[idx]];
		[tempArray removeObjectAtIndex:idx];
	}
	
	return [NSArray arrayWithArray:idxArray];
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
