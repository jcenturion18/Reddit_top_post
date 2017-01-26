//
// RestClient.m
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import "SimpleRestClient.h"

@implementation SimpleRestClient

- (void)getWithURL:(NSString *)urlString
{
	NSURL *url = [NSURL URLWithString:urlString];

	NSURLSession *URLSession = [NSURLSession sharedSession];
	NSURLSessionDataTask *downloadTask = [URLSession
		                                  dataTaskWithURL:url completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
		// 4: Handle response here
		NSError *parseError;
		NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
			                                                 options:kNilOptions
			                                                   error:&parseError];

		NSLog(@"");
	}];

	// 3
	[downloadTask resume];
}

@end
