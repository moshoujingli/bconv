//
//  BCVAppDelegate.h
//  bconv
//
//  Created by BiXiaopeng on 14-5-24.
//  Copyright (c) 2014年 BiXiaopeng. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BCVAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSMatrix *fileTypes;
@property (weak) IBOutlet NSTextField *status;

@end
