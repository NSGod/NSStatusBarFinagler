//
//  MDAppDelegate.m
//  NSStatusBar Finagler
//
//  Created by Mark Douma on 1/16/2013.
//  Copyright (c) 2013 Mark Douma. All rights reserved.
//

#import "MDAppDelegate.h"

#define MD_DEBUG 1

@implementation MDAppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
#if MD_DEBUG
    NSLog(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
	_statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
	_statusItem.menu = _statusItemMenu;
	_statusItem.title = NSLocalizedString(@"NSStatusItem", @"");
	[self updateLoggedInStatus];
}

- (void)updateLoggedInStatus {
#if MD_DEBUG
    NSLog(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
	[self.statusField setStringValue:(self.loggedIn ? NSLocalizedString(@"Logged in", @"") : NSLocalizedString(@"Logged out", @""))];
}

- (IBAction)toggleLoginLogout:(id)sender {
#if MD_DEBUG
    NSLog(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
	[self.progressIndicator startAnimation:nil];
	[self.progressField setStringValue:(self.loggedIn ? NSLocalizedString(@"Logging out…", @"") : NSLocalizedString(@"Logging in…", @""))];
	[self performSelector:@selector(finishFakeLoginLogout:) withObject:nil afterDelay:2.0];
}

- (void)finishFakeLoginLogout:(id)sender {
#if MD_DEBUG
    NSLog(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
	self.loggedIn = !self.loggedIn;
	[self.progressIndicator stopAnimation:nil];
	[self.progressField setStringValue:@""];
	[self updateLoggedInStatus];
}

- (void)menuNeedsUpdate:(NSMenu *)menu {
#if MD_DEBUG
    NSLog(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
}

- (BOOL)validateMenuItem:(NSMenuItem *)menuItem {
#if MD_DEBUG
    NSLog(@"[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif
	SEL action = menuItem.action;
	if (action == @selector(toggleLoginLogout:)) {
		[menuItem setTitle:(self.loggedIn ? NSLocalizedString(@"Logout", @"") : NSLocalizedString(@"Login", @""))];
		return YES;
	}
	return YES;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
	return YES;
}

@end
