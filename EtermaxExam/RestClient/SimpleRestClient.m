//
// RestClient.m
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import "SimpleRestClient.h"

#import <UIKit/UIKit.h>

@interface SimpleRestClient ()

@end

@implementation SimpleRestClient

- (void)getDataWithURL:(NSString *)urlString withSuccessBlock:(SuccessBlock)successBlock andFailBlock:(FailBlock)failBlock
{
	NSURL *url = [NSURL URLWithString:urlString];

	NSURLSession *URLSession = [NSURLSession sharedSession];
	NSURLSessionDataTask *downloadTask = [URLSession
		                                  dataTaskWithURL:url completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
		if (error && failBlock) {
		    failBlock(error);
		}

		if (response) {
		    NSError *parseError;
		    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
				                                                 options:kNilOptions
				                                                   error:&parseError];

		    if (successBlock) {
		        successBlock(json);
			}
		}
	}];

	[downloadTask resume];
}

- (void)downloadPictureFromURL:(NSString *)urlString withSuccessBlock:(SuccessBlock)successBlock andFailBlock:(FailBlock)failBlock
{
	NSURL *url = [NSURL URLWithString:urlString];

	NSURLSessionDownloadTask *downloadPhotoTask = [[NSURLSession sharedSession]
		                                           downloadTaskWithURL:url completionHandler: ^(NSURL *location, NSURLResponse *response, NSError *error) {
		if (error && failBlock) {
		    failBlock(error);
		}

		UIImage *downloadedImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];

		if (successBlock && downloadedImage) {
		    successBlock(downloadedImage);
		}
	}];

	[downloadPhotoTask resume];
}

@end
