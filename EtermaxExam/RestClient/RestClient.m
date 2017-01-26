//
// RestClient.m
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import "RestClient.h"

@implementation RestClient

- (void)getWithURL:(NSString *)urlString
{
	NSURL *url = [NSURL URLWithString:urlString];

	NSURLSession *URLSession = [NSURLSession sharedSession];
	NSURLSessionDataTask *downloadTask = [URLSession
		                                  dataTaskWithURL:url completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
		// 4: Handle response here
	}];

	// 3
	[downloadTask resume];
}

@end
