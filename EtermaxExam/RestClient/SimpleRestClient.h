//
// RestClient.h
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SimpleRestClient : NSObject

	typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailBlock)(NSError *error);

- (void)getDataWithURL:(NSString *)urlString withSuccessBlock:(SuccessBlock)sBlock andFailBlock:(FailBlock)fBlock;
- (void)downloadPictureFromURL:(NSString *)urlString withSuccessBlock:(SuccessBlock)successBlock andFailBlock:(FailBlock)failBlock;
@end
