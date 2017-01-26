//
// ViewController.m
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import "ViewController.h"
#import "RestClient.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.

	RestClient *restClient = [RestClient new];

https:    // api.reddit.com/top?limit=2
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
