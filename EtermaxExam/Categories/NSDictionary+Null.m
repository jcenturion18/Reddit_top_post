//
// NSDictionary+Null.m
// EtermaxExam
//
// Created by Julian Centurion on 26/1/17.
// Copyright © 2017 Julian Centurion. All rights reserved.
//

#import "NSDictionary+Null.h"

@implementation NSDictionary (Null)

- (id)ns_objectForKey:(id)key
{
	id object = [self objectForKey:key];

	return [self isNullOrEmpty:object] ? nil : object;
}

- (BOOL)isNullOrEmpty:(id)object
{
	if (object == nil || [object isEqual:[NSNull null]]) {
		return YES;
	}

	if ([object isKindOfClass:[NSString class]]) {
		if ([object isEqualToString:@""]) {
			return YES;
		}
	}

	return NO;
}

@end
