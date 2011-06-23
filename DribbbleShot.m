//
//  DribbbleShot.m
//  LockerRoom
//
//  Created by Joni Salonen on 6/21/11.
//  Copyright 2011 bilambee. All rights reserved.
//

#import "DribbbleShot.h"


@implementation DribbbleShot

@synthesize url;
@synthesize title;
@synthesize imageURL;
@synthesize playerUsername;

-(DribbbleShot*)initFromAPI:(NSDictionary*)shot
{
	self.url = [NSURL URLWithString:[shot objectForKey:@"url"]];
	self.imageURL = [NSURL URLWithString:[shot objectForKey:@"image_url"]];
	self.playerUsername = [[shot objectForKey:@"player"] objectForKey:@"username"];
	self.title = [shot objectForKey:@"title"];
	localPath = nil;
	return self;
}

-(void)dealloc
{
	[url release];
	[title release];
	[imageURL release];
	[playerUsername release];
	[localPath release];
	[super dealloc];
}

-(NSString*)finderComment
{
	NSString *comment = [NSString stringWithFormat:@"\"%@\" by %@\n%@",
						 title, playerUsername, url];
	return comment;
}

-(NSString*)localPath
{
	if (localPath == nil) {
		NSString *lastURLComponent = [url lastPathComponent];
		NSRange range = [lastURLComponent rangeOfString:@"-"];
		NSString *image = [lastURLComponent substringFromIndex:range.location+range.length];
		NSString *ext = [imageURL pathExtension];
		localPath = [[NSString stringWithFormat:@"%@-%@.%@",
					  playerUsername, image, ext] retain];
	}
	return localPath;
}

@end
