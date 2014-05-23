//
//  BCVAppDelegate.m
//  bconv
//
//  Created by BiXiaopeng on 14-5-24.
//  Copyright (c) 2014年 BiXiaopeng. All rights reserved.
//

#import "BCVAppDelegate.h"

@interface BCVAppDelegate()
@property (nonatomic)NSArray* filesToConvert;

@end


@implementation BCVAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)convertPushed:(id)sender {
    NSStringEncoding encodeTypes = [self.fileTypes selectedTag]==0?NSShiftJISStringEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    int i=1;
    for (NSURL* url in self.filesToConvert) {
        NSString* content = [NSString stringWithContentsOfURL:url encoding:encodeTypes error:nil];
//        NSString* fileName = [url.path lastPathComponent];
        NSString *fileName = [NSString stringWithFormat:@"%d.sgf",i];
        [content writeToFile:fileName atomically:YES encoding:NSUTF8StringEncoding error:nil];
        i++;
    }
    [self.status setStringValue:@"Files converted"];
}
- (IBAction)selectPushed:(id)sender {
    NSOpenPanel * openPanel = [NSOpenPanel openPanel];
    [openPanel setAllowsMultipleSelection:NO];
    [openPanel setCanChooseDirectories:NO];
    [openPanel setCanChooseFiles:YES];
    [openPanel setAllowsMultipleSelection:YES];
    //    [openPanel setMessage:@""];
    [openPanel beginWithCompletionHandler:^(NSInteger result) {
        
        if (result == NSOKButton)
        {
            NSArray* urls = [openPanel URLs];
            for (NSURL* url in urls) {
                NSLog(url.path  );
            }
            [self.status setStringValue:@"Files selected"];
            self.filesToConvert = urls;
        }
        
    }];
}

@end
