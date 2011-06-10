//
//  LockerRoomAppDelegate.m
//  LockerRoom
//
//  Created by Joni Salonen on 5/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LockerRoomAppDelegate.h"
#import "DribbbleLikeDownloader.h"

@implementation LockerRoomAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	downloader = nil;
	updateTimer = [[NSTimer
					scheduledTimerWithTimeInterval:120.0
					target:self
					selector:@selector(downloadLikes)
					userInfo:nil
					repeats:YES] retain];
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	if ([defaults stringForKey:@"DribbbleUserName"] == nil) {
		[preferenceWindow makeKeyAndOrderFront:self];
	}
}

-(void)dealloc
{
	[updateTimer release];
	[downloader release];
	[super dealloc];
}

-(void)downloadLikes
{
	// what if user name or directory is changed while the downloader is working?
	if (downloader == nil) {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		NSString *username = [defaults stringForKey:@"DribbbleUserName"];
		NSString *directory = [defaults stringForKey:@"LockerRoomDirectory"];
		NSLog(@"Username: %@ Directory: %@", username, directory);
		if (username != nil && directory != nil) {
			downloader = [DribbbleLikeDownloader downloaderForPlayer:username directory:directory];
		} else {
			downloader = nil;
			// bail out
			return;
		}
	}
	[downloader downloadLikes:self];
}

-(void)dribbbleLikeDownloaderFinished:(DribbbleLikeDownloader*)dld
{
	NSLog(@"Downloader finished");
	[menulet setBusy:NO];
	[downloader release];
	downloader = nil;
}

-(void)dribbbleLikeDownloaderStarted:(DribbbleLikeDownloader*)dld
{
	NSLog(@"Downloader started");
	[menulet setBusy:YES];
}

@end
