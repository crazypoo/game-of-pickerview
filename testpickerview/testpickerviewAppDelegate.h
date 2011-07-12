//
//  testpickerviewAppDelegate.h
//  testpickerview
//
//  Created by hou wenjie on 11-7-12.
//  Copyright 2011年 cqupt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class testpickerviewViewController;

@interface testpickerviewAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet testpickerviewViewController *viewController;

@end
