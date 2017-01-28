//
// ViewController.m
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import "ViewController.h"
#import "SimpleRestClient.h"
#import "RedditPostModelHandler.h"
#import "RedditPostTableViewCell.h"

static NSString *const kDequeueReusable = @"redditPostCell";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) SimpleRestClient *restClient;
@property (nonatomic, strong) NSArray *postModelArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
	self.tableView.delegate = self;
	self.tableView.dataSource = self;

	self.restClient = [SimpleRestClient new];

	[self registerTableViewCell];
	[self callInitialRequest];
}

- (void)callInitialRequest
{
	__weak ViewController *weakSelf = self;

	[self.restClient getDataWithURL:@"https://api.reddit.com/top?limit=25" withSuccessBlock: ^(id responseObject) {
	    // NSLog(responseObject);

	    RedditPostModelHandler *handler = [RedditPostModelHandler new];
	    weakSelf.postModelArray = [handler createArrayWithDictionary:responseObject];
	    [weakSelf reloadTableData];
	} andFailBlock: ^(NSError *error) {
	    [weakSelf showAlertWithTitle:@"Hubo un error" andMessage:@"Hubo un error al obtener los datos"];
	}];
}

- (void)registerTableViewCell
{
	NSString *cellName = NSStringFromClass([RedditPostTableViewCell class]);
	[self.tableView registerNib:[UINib nibWithNibName:cellName bundle:nil] forCellReuseIdentifier:kDequeueReusable];
}

- (void)reloadTableData
{
	[self.tableView reloadData];
}

- (void)showAlertWithTitle:(NSString *)title andMessage:(NSString *)message
{
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
		                                                           message:message
		                                                    preferredStyle:UIAlertControllerStyleAlert];

	__weak ViewController *weakSelf = self;

	UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Reintentar" style:UIAlertActionStyleDefault
		                                                  handler: ^(UIAlertAction *action) {
		[weakSelf callInitialRequest];
	}];

	[alert addAction:defaultAction];

	[self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UITableView delegate methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	RedditPostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDequeueReusable forIndexPath:indexPath];

	[cell setUpCellWithModel:[self.postModelArray objectAtIndex:indexPath.row]];

	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 119;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.postModelArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

@end
