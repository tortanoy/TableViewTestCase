//
//  TestUITableViewTests.m
//  TestUITableViewTests
//
//  Created by Surapong Suwanlee on 11/10/2558 BE.
//  Copyright © 2558 Surapong Suwanlee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TableViewController.h"

@interface TestUITableViewTests : XCTestCase

@property (strong, nonatomic) TableViewController *tbVC;

@end

@implementation TestUITableViewTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.tbVC = [storyboard instantiateViewControllerWithIdentifier:@"TableVC"];
    [self.tbVC performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.tbVC = nil;
}

- (void)testThatTableViewLoads {
    XCTAssertNotNil(self.tbVC, @"tableview not initiated properly");
}

#pragma mark - UITableView tests
- (void)testThatTableViewHasDataSource
{
    XCTAssertNotNil(self.tbVC.tableView.dataSource, @"Table datasource cannot be nil");
}

- (void)testTableViewIsConnectedToDelegate
{
    XCTAssertNotNil(self.tbVC.tableView.delegate, @"Table delegate cannot be nil");
}

- (void)testTableViewNumberOfRowsInSection {
    NSUInteger expectedRows = 10;
    XCTAssertTrue([self.tbVC tableView:self.tbVC.tableView numberOfRowsInSection:0] == expectedRows, @"Table has %ld rows but it should have %ld", (long)[self.tbVC tableView:self.tbVC.tableView numberOfRowsInSection:0], (long)expectedRows);
}



- (void)testTableViewCellCreateCellsWithReuseIdentifier
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [self.tbVC tableView:self.tbVC.tableView cellForRowAtIndexPath:indexPath];
    NSString *expectedReuseIdentifier = @"Cell";
    XCTAssertTrue([cell.reuseIdentifier isEqualToString:expectedReuseIdentifier], @"Table does not create reusable cells");
}

- (void)testTableViewHeightForRowAtIndexPath {
    CGFloat expectedHeight = 44.0;
    CGFloat actualHeight = [self.tbVC tableView:self.tbVC.tableView heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    NSLog(@"%f", actualHeight);
    XCTAssertEqual(expectedHeight, actualHeight, @"Cell should have %f height, but they have %f", expectedHeight, actualHeight);
}

@end
