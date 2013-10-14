//
//  MDAppDelegate.h
//  NSStatusBar Finagler
//
//  Created by Mark Douma on 1/16/2013.
//  Copyright (c) 2013 Mark Douma. All rights reserved.
//

#import <Cocoa/Cocoa.h>



@interface MDAppDelegate : NSObject <NSApplicationDelegate, NSMenuDelegate>


@property (strong) NSStatusItem *statusItem;


@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSMenu *statusItemMenu;
@property (weak) IBOutlet NSMenuItem *toggleLoginLogoutMenuItem;

@property (weak) IBOutlet NSTextField *statusField;
@property (weak) IBOutlet NSTextField *progressField;

@property (weak) IBOutlet NSProgressIndicator *progressIndicator;


@property (assign) BOOL loggedIn;


- (IBAction)toggleLoginLogout:(id)sender;


@end


