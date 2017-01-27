//
// ViewController.m
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import "ViewController.h"
#import "SimpleRestClient.h"

@interface ViewController ()
@property (nonatomic, strong) SimpleRestClient *restClient;
@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.

	self.restClient = [SimpleRestClient new];

	[self callInitialRequest];
}

- (void)callInitialRequest
{
	__weak ViewController *weakSelf = self;

	[self.restClient getDataWithURL:@"https://api.reddit.com/top?limit=25" withSuccessBlock: ^(id responseObject) {
	    // NSLog(responseObject);
	} andFailBlock: ^(NSError *error) {
	    [weakSelf showAlertWithTitle:@"Hubo un error" andMessage:@"Hubo un error al obtener los datos"];
	}];
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

@end
