//
// RestClient.h
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestClient : NSObject

- (void)getWithURL:(NSString *)urlString;

@end
