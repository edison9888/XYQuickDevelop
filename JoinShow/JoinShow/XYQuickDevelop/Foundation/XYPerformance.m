//
//  XYPerformance.m
//  JoinShow
//
//  Created by Heaven on 13-8-23.
//  Copyright (c) 2013年 Heaven. All rights reserved.
//

#import "XYPerformance.h"

#pragma mark -

@interface XYPerformance()
{
	NSMutableDictionary *	_records;
	NSMutableDictionary *	_tags;
}
@end

#pragma mark -

@implementation XYPerformance

DEF_SINGLETON( XYPerformance );

@synthesize records = _records;
@synthesize tags = _tags;

- (id)init
{
	self = [super init];
	if ( self )
	{
		_records = [[NSMutableDictionary alloc] init];
		_tags = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (void)dealloc
{
	[_tags removeAllObjects];
	[_tags release];
	
	[_records removeAllObjects];
	[_records release];
    
	[super dealloc];
}

+ (double)timestamp
{
	return CACurrentMediaTime();
}

+ (double)markTag:(NSString *)tag
{
	double curr = CACurrentMediaTime();
	
	NSNumber * time = [NSNumber numberWithDouble:curr];
	[[XYPerformance sharedInstance].tags setObject:time forKey:tag];
	
	return curr;
}

+ (double)betweenTag:(NSString *)tag1 andTag:(NSString *)tag2
{
	return [self betweenTag:tag1 andTag:tag2 shouldRemove:YES];
}

+ (double)betweenTag:(NSString *)tag1 andTag:(NSString *)tag2 shouldRemove:(BOOL)remove
{
	NSNumber * time1 = [[XYPerformance sharedInstance].tags objectForKey:tag1];
	NSNumber * time2 = [[XYPerformance sharedInstance].tags objectForKey:tag2];
	
	if ( nil == time1 || nil == time2 )
		return 0.0;
	
	double time = fabs( [time2 doubleValue] - [time1 doubleValue] );
	
	if ( remove )
	{
		[[XYPerformance sharedInstance].tags removeObjectForKey:tag1];
		[[XYPerformance sharedInstance].tags removeObjectForKey:tag2];
	}
	
	return time;
}

+ (void)watchClass:(Class)clazz
{
	[self watchClass:clazz andSelector:nil];
}

+ (void)watchClass:(Class)clazz andSelector:(SEL)selector
{
	// TODO:
}

+ (void)recordName:(NSString *)name andTime:(NSTimeInterval)time
{
	NSLogD( @"%s '%@' = %.4f(s)", __PRETTY_FUNCTION__, name, time );
}

@end