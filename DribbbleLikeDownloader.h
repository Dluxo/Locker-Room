//
//  DribbbleLikeDownloader.h
//  LockerRoom
//
//  Created by Joni Salonen on 5/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DribbbleLikeDownloader : NSObject {
	NSString *playerId;
	NSString *targetDirectory;
	NSInteger currentPage;
	NSInteger numberOfPages;
	NSInteger currentDownloads;
	BOOL downloadInProgress;
	
	NSMutableData *currentData;
	id currentDelegate;
}

+(DribbbleLikeDownloader*)downloaderForPlayer:(NSString*)playerId directory:(NSString *)target;


-(void)downloadLikes:(id)delegate;

@end
