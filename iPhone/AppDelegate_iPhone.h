//
//  AppDelegate_iPhone.h
//  instantMaps
//
//  Created by John Lyons on 13/09/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "map2.h"

@class restareasViewController;

@interface AppDelegate_iPhone : NSObject <UIApplicationDelegate,UITabBarControllerDelegate> {
    UIWindow *window;
    restareasViewController *viewController;
	
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet restareasViewController *viewController;


@end

