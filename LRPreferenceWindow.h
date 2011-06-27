//
//  LRPreferenceWindow.h
//
//  Created by Joni Salonen on 5/20/11.
//  Copyright 2011 bilambee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "LRPathPopUpButton.h"

@interface LRPreferenceWindow : NSWindow {
	IBOutlet NSTextField *txtUsername;
	IBOutlet LRPathPopUpButton *pathPopUp;
	IBOutlet NSButton *launchAtLogin;
}

-(IBAction)readDefaults:(id)sender;

@end
