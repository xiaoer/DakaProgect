//
//  UUID.m
//  EntryInfoViewController
//
//  Created by ma.wenqiu on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UUID.h"


@implementation UUID

+ (NSString *)GetUUID
{
	CFUUIDRef theUUID = CFUUIDCreate(NULL);
	CFStringRef string = CFUUIDCreateString(NULL, theUUID);
	CFRelease(theUUID);
	return [(NSString *)string autorelease];
}

@end
